﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BVSoftware.Shipping.Services
{
    public class RateTableByItemCount: IShippingService
    {
        private List<ShippingServiceMessage> _Messages = new List<ShippingServiceMessage>();

        public string Name
        {
            get { return "Rate Table By Item Count";}
        }

        public string Id
        {
            get { return "7068B66A-0336-4228-B1A8-03E034FECCDA"; }
		}

        public RateTableSettings Settings { get; set; }
        public ServiceSettings BaseSettings
        {
            get { return Settings; }
        }

        public RateTableByItemCount()
        {
            Settings = new RateTableSettings();
        }

        public List<IServiceCode> ListAllServiceCodes()
        {
            return new List<IServiceCode>();
        }

        public List<IShippingRate> RateShipment(IShipment shipment)
        {
            int totalItems = 0;

            foreach (IShippable item in shipment.Items)
            {
                totalItems += item.QuantityOfItemsInBox;
            }


            decimal amount = 0;
            if (Settings != null)
            {
                if (Settings.GetLevels() != null)
                {
                    amount = RateTableLevel.FindRateFromLevels(totalItems, Settings.GetLevels());
                }
            }

            ShippingRate r = new ShippingRate();
            r.ServiceId = this.Id;
            r.EstimatedCost = amount;

            List<IShippingRate> rates = new List<IShippingRate>();
            rates.Add(r);
            
            return rates;
        }

        public List<ShippingServiceMessage> LatestMessages
        {
            get
            {
                return _Messages;
            }
            set
            {
                _Messages = value;
            }
        }

    }    
}
