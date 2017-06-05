using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FamilyConnext.Models;
using Microsoft.AspNet.Identity;

namespace FamilyConnext.Controllers
{
    public class ConnectionsController : Controller
    {
        private FamilyConnextEntities1 db = new FamilyConnextEntities1();

        // GET: Connections
        public ActionResult Index()
        {
            //Below I'm creating a variable to hold the current user's user Id
            var currentUser = User.Identity.GetUserId();
            //Below is the LINQ query for selecting only current user's family info
            var connections = from connection in db.Connections
                              where connection.FamilyID == currentUser
                              select connection;

            //Sends all family connections to the list
            return View(connections.ToList());
        }

        //GET & Calculate family score
        
        public ActionResult ViewScore()
        {
            var currentUser = User.Identity.GetUserId();
            
            var familyScore = 0;
            var thisFamily = from entry in db.Connections
                             where entry.FamilyID == currentUser
                             select entry;

            foreach (var score in thisFamily)
            {
                familyScore += score.PointsAwarded;
            }
            ViewBag.thisFamilyScore = familyScore;


            return View();
        }


            // GET: Connections/Details/5
            public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Connection connection = db.Connections.Find(id);
            if (connection == null)
            {
                return HttpNotFound();
            }
            return View(connection);
        }

        // GET: Connections/Create
        public ActionResult Create()
        {
            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "MemberName");
            return View();
        }

        // POST: Connections/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ConnectionID,MemberID,ConnectionDescription,PointsAwarded,FamilyID")] Connection connection)
        {
            if (ModelState.IsValid)
            {
                connection.FamilyID = User.Identity.GetUserId();
                db.Connections.Add(connection);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "MemberName", connection.MemberID);
            return View(connection);
        }

        // GET: Connections/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Connection connection = db.Connections.Find(id);
            if (connection == null)
            {
                return HttpNotFound();
            }
            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "MemberName", connection.MemberID);
            return View(connection);
        }

        // POST: Connections/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ConnectionID,MemberID,ConnectionDescription,PointsAwarded,FamilyID")] Connection connection)
        {
            if (ModelState.IsValid)
            {
                db.Entry(connection).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "MemberName", connection.MemberID);
            return View(connection);
        }

        // GET: Connections/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Connection connection = db.Connections.Find(id);
            if (connection == null)
            {
                return HttpNotFound();
            }
            return View(connection);
        }

        // POST: Connections/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Connection connection = db.Connections.Find(id);
            db.Connections.Remove(connection);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
