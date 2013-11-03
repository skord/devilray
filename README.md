# DevilRay - The Manta Explorer

DevilRay aims to allow folks to inspect the details of their data in Joyent's Manta. 

Requirements:

* Ruby
* PostgreSQL DB
* Redis
* Patience.

Proceed as you would developing or deploying any Rails app. 


## Why What How?

Well, currently DevilRay only allows you to only view your private Manta data directory structure in /username/stor after you've logged in and configured it. 

The eventual point of DevilRay is to give you some high-level overviews of what's in your Manta cloud. 

Use Cases:

* You'd like a pretty view of your aggregated access/usage data so you know what the bill will be this month or you can plan out a CDN.
* Someone in your organization has been queing up lots of jobs. Have an easy view to know if they're all being stopped by the end of the day. 
* Auto-expiring and cleaning out old data based on rules.
* A quick way to setup snaplinks to create a point-in-time snapshot of an asset (or group of assets), or just share it to your public-facing Manta bucket.
* Storing often used map/reduce jobs and executing them against arbitrary collections of data you've uploaded.
* Scheduling any or all of the above, watching directories for things that should be put from local storage into Manta, whatever.


## Great, this doesn't do those things.

That's where you can come in.

* Fork this repo.
* Make some changes.
* Submit a pull request
* Have those things. 
 
Can't do those things? Have a wacky idea? Open a Github Issue, I'll see what I can do. 
