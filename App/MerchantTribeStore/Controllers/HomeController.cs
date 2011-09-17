﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BVSoftware.Commerce;

namespace BVCommerce.Controllers
{
    public class HomeController : Shared.BaseStoreController
    {
        // Redirects to the correct home URL without page name
        public ActionResult ToIndex()
        {
            string homeUrl = Url.Content("~");
            return RedirectPermanent(homeUrl);
        }

        //
        // GET: /Home/
        public ActionResult Index()
        {
            // Redirect to Sign up if we're multi-store
            // TODO - Change this to return the signup view instead
            if (!WebAppSettings.IsIndividualMode)
            {
                if (BVApp.CurrentStore.StoreName == "www")
                {
                    return Redirect("/signup/home.aspx");
                }
            }

            SessionManager.CategoryLastId = string.Empty;
            ViewBag.Title = BVApp.CurrentStore.Settings.FriendlyName;
            ViewBag.BodyClass = "store-home-page";

            return View();
        }

    }
}