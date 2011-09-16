﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using BVSoftware.Commerce;
using BVSoftware.CommerceDTO.v1;
using BVSoftware.CommerceDTO.v1.Orders;
using BVSoftware.Commerce.Orders;

namespace BVCommerce.api.rest
{
    public class OrderTransactionsHandler: BaseRestHandler
    {
        public OrderTransactionsHandler(BVSoftware.Commerce.BVApplication app)
            : base(app)
        {

        }

        // List or Find Single
        public override string GetAction(string parameters, System.Collections.Specialized.NameValueCollection querystring)
        {
            string data = string.Empty;

            if (string.Empty == (parameters ?? string.Empty))
            {
                // List
                ApiResponse<List<OrderTransactionDTO>> response = new ApiResponse<List<OrderTransactionDTO>>();

                string orderBvin = querystring["orderbvin"] ?? string.Empty;
                List<OrderTransaction> results = new List<OrderTransaction>();
                if (orderBvin.Trim().Length > 0)
                {
                    results = BVApp.OrderServices.Transactions.FindForOrder(orderBvin);
                }
                List<OrderTransactionDTO> dto = new List<OrderTransactionDTO>();

                foreach (OrderTransaction item in results)
                {
                    dto.Add(item.ToDto());
                }
                response.Content = dto;
                data = MerchantTribe.Web.Json.ObjectToJson(response);
            }
            else
            {
                // Find One Specific Category
                ApiResponse<OrderTransactionDTO> response = new ApiResponse<OrderTransactionDTO>();
                string bvin = FirstParameter(parameters);
                Guid tempId = new Guid();
                Guid.TryParse(bvin, out tempId);
                OrderTransaction item = BVApp.OrderServices.Transactions.Find(tempId);
                if (item == null)
                {
                    response.Errors.Add(new ApiError("NULL", "Could not locate that transaction. Check bvin and try again."));
                }
                else
                {
                    response.Content = item.ToDto();
                }
                data = MerchantTribe.Web.Json.ObjectToJson(response);
            }

            return data;
        }

        // Create or Update
        public override string PostAction(string parameters, System.Collections.Specialized.NameValueCollection querystring, string postdata)
        {
            string data = string.Empty;
            string bvin = FirstParameter(parameters);
            ApiResponse<OrderTransactionDTO> response = new ApiResponse<OrderTransactionDTO>();

            OrderTransactionDTO postedItem = null;
            try
            {
                postedItem = MerchantTribe.Web.Json.ObjectFromJson<OrderTransactionDTO>(postdata);
            }
            catch (Exception ex)
            {
                response.Errors.Add(new ApiError("EXCEPTION", ex.Message));
                return MerchantTribe.Web.Json.ObjectToJson(response);
            }

            OrderTransaction item = new OrderTransaction();            
            item.FromDto(postedItem);
            
            OrderTransaction existing = BVApp.OrderServices.Transactions.Find(item.Id);
            if (existing == null || item.IdAsString == "00000000-0000-0000-0000-000000000000")
            {
                item.StoreId = BVApp.CurrentStore.Id;
                item.Id = System.Guid.NewGuid();
                BVApp.OrderServices.Transactions.Create(item);
            }            
            else
            {
                item.StoreId = BVApp.CurrentStore.Id;
                BVApp.OrderServices.Transactions.Update(item);
            }
            OrderTransaction resultItem = BVApp.OrderServices.Transactions.Find(item.Id);
            if (resultItem != null) response.Content = resultItem.ToDto();

            data = MerchantTribe.Web.Json.ObjectToJson(response);
            return data;
        }

        public override string DeleteAction(string parameters, System.Collections.Specialized.NameValueCollection querystring, string postdata)
        {
            string data = string.Empty;
            string bvin = FirstParameter(parameters);
            Guid tempId = new Guid();
            Guid.TryParse(bvin, out tempId);
            ApiResponse<bool> response = new ApiResponse<bool>();

            // Single Item Delete
            response.Content = BVApp.OrderServices.Transactions.Delete(tempId);

            data = MerchantTribe.Web.Json.ObjectToJson(response);
            return data;
        }
    }
}