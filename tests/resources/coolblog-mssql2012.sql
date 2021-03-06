/* Migrated MySQL coolblog.sql via Microsoft SSMS MySQL Data Migration Tool */
/* Target DB was SQL Server 2012 or later  */
/* Migration & tweaks by Samuel Knowlton <sam@inleague.org> @ inLeague LLC  */
/* INSTALLATION: Create a database called coolblog with compatibility level SQL Server 2012 or later. */

USE [coolblog]
GO
/****** Object:  Schema [coolblog]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE SCHEMA [coolblog]
GO
/****** Object:  Schema [m2ss]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Table [dbo].[blogentries]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogentries](
	[blogEntriesID] [int] IDENTITY(16,1) NOT NULL,
	[blogEntriesLink] [varchar](max) NOT NULL,
	[blogEntriesTitle] [varchar](max) NOT NULL,
	[blogEntriesDescription] [varchar](max) NOT NULL,
	[blogEntriesDatePosted] [datetime2](0) NOT NULL,
	[blogEntriesdateUpdated] [datetime2](0) NOT NULL,
	[blogEntriesIsActive] [binary](1) NOT NULL,
	[blogsID] [int] NULL,
 CONSTRAINT [PK_blogentries_blogEntriesID] PRIMARY KEY CLUSTERED
(
	[blogEntriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[blogs]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogs](
	[blogsID] [int] IDENTITY(2,1) NOT NULL,
	[blogsURL] [varchar](max) NOT NULL,
	[blogsWebsiteurl] [varchar](max) NOT NULL,
	[blogslanguage] [varchar](10) NOT NULL,
	[blogsTitle] [varchar](max) NOT NULL,
	[blogsDescription] [varchar](max) NOT NULL,
	[blogsdateBuilt] [datetime2](0) NOT NULL,
	[blogsdateSumitted] [datetime2](0) NOT NULL,
	[blogsIsActive] [binary](1) NOT NULL,
	[blogsAuthorname] [varchar](200) NULL,
	[blogsauthorEmail] [varchar](200) NULL,
	[blogsauthorURL] [varchar](max) NULL,
 CONSTRAINT [PK_blogs_blogsID] PRIMARY KEY CLUSTERED
(
	[blogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cachebox]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cachebox](
	[id] [nvarchar](100) NOT NULL,
	[objectKey] [nvarchar](255) NOT NULL,
	[objectValue] [nvarchar](max) NOT NULL,
	[hits] [int] NOT NULL,
	[timeout] [int] NOT NULL,
	[lastAccessTimeout] [int] NOT NULL,
	[created] [datetime2](0) NOT NULL,
	[lastAccessed] [datetime2](0) NOT NULL,
	[isExpired] [smallint] NOT NULL,
	[isSimple] [smallint] NOT NULL,
 CONSTRAINT [PK_cachebox_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [varchar](50) NOT NULL,
	[category] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[modifydate] [datetime] NOT NULL,
	[testValue] [varchar](100) NULL,
 CONSTRAINT [PK_categories_category_id] PRIMARY KEY CLUSTERED
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[comment_id] [varchar](50) NOT NULL,
	[FKentry_id] [varchar](50) NOT NULL,
	[comment] [varchar](max) NOT NULL,
	[time] [datetime] NOT NULL,
 CONSTRAINT [PK_comments_comment_id] PRIMARY KEY CLUSTERED
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(4,1) NOT NULL,
	[firstName] [varchar](255) NULL,
	[lastName] [varchar](255) NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [PK_contact_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[entries]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entries](
	[entry_id] [varchar](50) NOT NULL,
	[entryBody] [varchar](max) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[postedDate] [datetime] NOT NULL,
	[FKuser_id] [varchar](36) NOT NULL,
 CONSTRAINT [PK_entries_entry_id] PRIMARY KEY CLUSTERED
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[entry_categories]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entry_categories](
	[FKcategory_id] [varchar](50) NOT NULL,
	[FKentry_id] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[logs]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logs](
	[id] [varchar](36) NOT NULL,
	[severity] [varchar](10) NOT NULL,
	[category] [varchar](100) NOT NULL,
	[logdate] [datetime2](0) NOT NULL,
	[appendername] [varchar](100) NOT NULL,
	[message] [varchar](max) NULL,
	[extrainfo] [varchar](max) NULL,
 CONSTRAINT [PK_logs_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relax_logs]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relax_logs](
	[id] [varchar](36) NOT NULL,
	[severity] [varchar](10) NOT NULL,
	[category] [varchar](100) NOT NULL,
	[logdate] [datetime2](0) NOT NULL,
	[appendername] [varchar](100) NOT NULL,
	[message] [varchar](max) NULL,
	[extrainfo] [varchar](max) NULL,
 CONSTRAINT [PK_relax_logs_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleID] [int] IDENTITY(6,1) NOT NULL,
	[role] [varchar](100) NULL,
 CONSTRAINT [PK_roles_roleID] PRIMARY KEY CLUSTERED
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[todo]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[todo](
	[blogsID] [int] IDENTITY(51,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_todo_blogsID] PRIMARY KEY CLUSTERED
(
	[blogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 12/14/2016 1:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[lastLogin] [datetime2](0) NULL,
	[FKRoleID] [int] NULL,
	[isActive] [binary](1) NULL,
 CONSTRAINT [PK_users_user_id] PRIMARY KEY CLUSTERED
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[blogentries] ON

INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (1, N'http://blog.coldbox.org/post.cfm/coldbox-wiki-docs-skins-shared', N'ColdBox Wiki Docs Skins Shared', N'Since we love collaboration and giving back to the community, we have just opened our Wiki Docs Skins github repository so you can check out how we build out our wiki docs skins for CodexWiki and hopefully you guys can send us your skins and we can use them on the wiki docs site :)', CAST(N'2011-04-06T11:13:52.0000000' AS DateTime2), CAST(N'2011-04-06T11:13:52.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (2, N'http://blog.coldbox.org/post.cfm/new-coldbox-wiki-docs', N'New ColdBox Wiki Docs', N'We have been wanting to update all our sites for a long time and the docs where first. Yesterday we updated our codex skins for the coldbox wiki docs and also started our documentation revisions and updates. You will see that it is now much much better organized and our new quick index feature enables you to get to content even faster. Hopefully in the coming weeks we will have all our documentation updated and running. Thank you for your support and feedback.', CAST(N'2011-04-06T10:57:17.0000000' AS DateTime2), CAST(N'2011-04-06T10:57:17.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (3, N'http://blog.coldbox.org/post.cfm/modules-contest-ends-this-friday', N'Modules Contest Ends This Friday', N'Just a quick reminder that our Modules Contest ends this Friday! So get to it, build some apps! Modules Contest URL: http://blog.coldbox.org/post.cfm/coldbox-modules-contest-extended', CAST(N'2011-04-04T11:22:19.0000000' AS DateTime2), CAST(N'2011-04-04T11:22:19.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (4, N'http://blog.coldbox.org/post.cfm/coldbox-connection-recording-coldbox-3-0-0', N'ColdBox Connection Recording: ColdBox 3.0.0', N'Thanks for attending our 3rd ColdBox Connection webinar today!&nbsp; This  webinar focused on ColdBox 3.0.0 release and goodies.&nbsp; Here is the recording for the show!', CAST(N'2011-03-30T15:42:16.0000000' AS DateTime2), CAST(N'2011-03-30T15:42:16.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (5, N'http://blog.coldbox.org/post.cfm/coldbox-platform-3-0-0-released', N'ColdBox Platform 3.0.0 Released', N'


I am so happy to finally announce ColdBox Platform 3.0.0 today on March 3.0, 2011. It has been over a year of research, testing, development, coding, long long nights, 1 beautiful baby girl, lots of headaches, lots of smiles, inspiration, blessings, new contributors, new team members, new company, new hopes, and ambitions. Overall, what an incredible year for ColdFusion and ColdBox development. I can finally say that this release has been the most ambitious release and project I have tackled in my entire professional life. I am so happy of the results and its incredible community response and involvement. So thank you so much Team ColdBox and all the community for the support and long hours of testing, ideas and development.
ColdBox 3 has been on a journey of 6 defined milestones and 2 release candidates in a spawn of over a year of development. Our vision was revamping the engine into discrete and isolated parts:

Core
LogBox : Enterprise Logging Library
WireBox : Enterprise Dependency Injection and AOP framework
CacheBox : Enterprise Caching Engine &amp; Cache Aggregator
MockBox : Mocking/Stubbing Framework

All of these parts are now standalone and can be used with any ColdFusion application or ColdFusion framework. We believe we build great tools and would like everybody to have access to them even though they might not even use ColdBox MVC. Apart from the incredible amount of enhancements, we also ventured into several incredible new features:

What''s New
ColdBox Modules : Bringing Modular Architecture to ANY ColdBox application
Programmatic configuration, no more XML
Incredible caching enhancements and integrations
Extensible and enterprise dependency injection
Aspect oriented programming
Integration testing, mocking, stubbing and incredible amount of tools for testing and verification
Customizable Flash RAM and future web flows
ColdFusion ORM and Hibernate Services
RESTful web services enhancement and easy creations
Tons more


The What''s New page can say it all! An incredible more than 700 issue tickets closed and ColdBox 3.1 is already in full planning phases. So apart from all this work culminating, we can also say we have transitioned into a complete professional open source software offering an incredible amount of professional services and backup to any enterprise or company running ColdBox or any of our supporting products (Relax, CodexWiki, ForumMan, DataBoss, Messaging, ...):

Support &amp; Mentoring Plans
Architecture &amp; Design
Over 4 professional training courses
Server Setup, Tuning and Optimizations
Custom Consulting and', CAST(N'2011-03-29T23:30:18.0000000' AS DateTime2), CAST(N'2011-03-29T23:30:18.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (6, N'http://blog.coldbox.org/post.cfm/cachebox-1-2-released', N'CacheBox 1.2 Released', N'

  In the spirit of more releases, here is: CacheBox 1.2.0.  CacheBox is an enterprise caching engine, aggregator and API for  ColdFusion applications.  It is part of the ColdBox 3.0.0 Platform but  it can also function on its own as a standalone framework and use it in any ColdFusion application and in any ColdFusion framework. 
The milestone page for this release can be found in our Assembla Code Tracker. Here is a synopsis of the tickets closed:


 

1179	 new cachebox store: BlackholeStore used for optimization and testing
1180	 cf store does not use createTimeSpan to create minute timespans for puts
1181	 lucee store does not use createTimeSpan to create minute timespans for puts
1182	 updates to make it coldbox 3.0 compatible
1192	 store locking mechanisms updated to improve locking and concurrency

So have fun playing with our new CacheBox release:

Download
Cheatsheet
Source Code
Documentation

 ', CAST(N'2011-03-29T23:26:09.0000000' AS DateTime2), CAST(N'2011-03-29T23:26:09.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (7, N'http://blog.coldbox.org/post.cfm/wirebox-1-1-1-released', N'WireBox 1.1.1 Released!', N'I am happy to announce WireBox 1.1.1 to the ColdFusion community. This release sports 3 critical fixes that will make your WireBox injectors run smoother and happier, especially for those doing java integration, this will help you some more.


Download
Cheatsheet
Source Code
Documentation
Our primer: Getting Jiggy Wit It!

  Issues Fixed

1184 changed way providers accessed scoped injectors via scope registration structure instead of injector references to avoid memory leaks
    1188 updated the java builder to ignore empty init arguments.
    1189 updated the java builder to do noInit() as it was ignoring it
', CAST(N'2011-03-29T23:20:32.0000000' AS DateTime2), CAST(N'2011-03-29T23:20:32.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (8, N'http://blog.coldbox.org/post.cfm/module-lifecycles-explained', N'Module Lifecycles Explained', N'In this short entry I just wanted to lay out a few new diagrams that explain the lifecycle of ColdBox modules.  As always, all our documentation reflects these changes as well.  This might help some of you developers getting ready to win that ColdBox Modules contest and get some cash and beer!

Module Service
The beauty of ColdBox Modules is that you have an internal module  service that you can tap to in order to dynamically interact with the  ColdBox Modules.  This service is available by talking to the main  ColdBox controller and calling its getModuleService() method:
// get module service from handlers, plugins, layouts, interceptors or views.
ms = controller.getModuleService();

// You can also inject it via our autowire DSL
property name="moduleService" inject="coldbox:moduleService";


Module Lifecycle



However, before we start reviewing the module service methods let''s  review how modules get loaded in a ColdBox application.  Below is a  simple bullet point of what happens in your application when it starts  up and you can also look at the diagram above:

ColdBox main application and configuration loads
ColdBox Cache, Logging and WireBox are created
Module Service calls on registerAllModules() to read all the  modules in the modules locations (with include/excludes) and start  registering their configurations one by one.  If the module had parent  settings, interception points, datasoures or webservices, these are  registered here.
All main application interceptors are loaded and configured
ColdBox is marked as initialized
Module service calls on activateAllModules() so it begins  activating only the registered modules one by one.  This registers the  module''s SES URL Mappings, model objects, etc
afterConfigurationLoad interceptors are fired
ColdBox aspects such as i18n, javaloader, ColdSpring/LightWire factories are loaded
afterAspectsLoad interceptors are fired

The most common methods that you can use to control the modules in your application are the following:

reloadAll() : Reload all modules in the application. This  clears out all module settings, re-registers from disk, re-configures  them and activates them
reload(module) : Target a module reload by name
unloadAll()  : Unload all modules
unload(module) : Target a module unload by name
registerAllModules() : Registers all module configurations
registerModule(module) : Target a module configuration registration
activateAllModules() : Activate all registered modules
activateModule(module) : Target activate a module that has been registered already
getLoadedModules() : Get an array of loaded module names
rebuildModuleRegistry() : Rescan all the module lcoations for newly installed modules and rebuild the registry so these modules can  be registered and activated.
registerAndActivateModule(module) : Registe', CAST(N'2011-03-29T11:42:49.0000000' AS DateTime2), CAST(N'2011-03-29T11:42:49.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (9, N'http://blog.coldbox.org/post.cfm/coldbox-connection-show-wednesday', N'ColdBox Connection Show Wednesday', N'Just a reminder that this March 3.0.0, 2011 we will be holding a special ColdBox Open Forum Connection at 9 AM PST.&nbsp; You can find more information below:Location:&nbsp; http://experts.adobeconnect.com/coldbox-connection/ColdBox Connection Shows: http://www.coldbox.org/media/connectionWatch out!! Something is coming!!', CAST(N'2011-03-28T20:59:29.0000000' AS DateTime2), CAST(N'2011-03-28T20:59:29.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (10, N'http://blog.coldbox.org/post.cfm/coldbox-modules-contest-extended', N'ColdBox Modules Contest Extended', N'We are extending our Modules Contest to allow for more time for entries to trickle in and of course to leverage ColdBox 3 coming this week.
Deadline: Module entries must be submitted by March 29th EXTENDED: April 8th, 2011 no later than 12PM PST to contests@ortussolutions.com
Winners Announced on March 30th EXTENDED: April 14th, 2011 The ColdBox Connection show at 9AM PST
ColdBox 3.0 Modules ContestCreate a ColdBox 3.0.0 module that is a fully functional application that can be portable for any ColdBox 3.0 application.  Here are some guidelines the ColdBox team will be evaluating the module on

Download ColdBox

The code must reside on either github or a public repository so it is publicly accessible

The user must create a forgebox entry and submit the module code to it: http://coldbox.org/forgebox

The more internal libraries it uses the more points it gets: LogBox, MockBox, WireBox, CacheBox

The module should do something productive, no say hello modules accepted

Best practices on MVC separation of concerns

Portability

Documentation (You had that one coming!!) as it might need DB setup or DSN setup

Be creative!

Make sure it works!


1st Prize

An Adobe ColdFusion 9 Standard License

$100 Amazon Gift Card

Six pack of "BrewFather" beer


2nd Prize

A ColdBox Book

A ColdBox T-Shirt

$25 Amazon Gift Card

Six pack of "BrewFather" beer
', CAST(N'2011-03-27T20:29:07.0000000' AS DateTime2), CAST(N'2011-03-27T20:29:07.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (11, N'http://blog.coldbox.org/post.cfm/coldbox-3-release-training-special-discounts', N'ColdBox 3 Release Training Special Discounts', N'
				We are currently holding a special promotion that starts today March 27, 2011 until April 3rd, 2011
				 at 3:00 PM PST.  Take advantage of this insane $300 off any training of your choice in honor
				 of our ColdBox 3.0.0 release this week.  Just use our discount code
				viva3 in our training registration pages or follow our links below and get this discount.
				Hurry as the code expires on April 3rd, 2011 at 3PM PST.


California Ontario/Los Angeles Training - April 27 to May 1, 2011

Discount Link: http://coldbox.eventbrite.com/?discount=viva3
CBOX-101 ColdBox Core on April 27 - April 29, 2011
CBOX-203 ColdBox Modules on April 30 - May 1, 2011

Pre-CFObjective Minneapolis Training - May 10-11, 2011

Discount Link: http://coldbox-cfobjective.eventbrite.com/?discount=viva3
CBOX-100 ColdBox Core on May 10-11, 2011
CBOX-202 WireBox Dependency Injection on May 10-11, 2011

Houston, Texas Training - April 27 to May 1, 2011

Discount Link: http://coldbox-texas.eventbrite.com/?discount=viva3
CBOX-101 ColdBox Core on July 6-8, 2011
CBOX-203 ColdBox Modules on July 7-8, 2011
', CAST(N'2011-03-27T20:18:44.0000000' AS DateTime2), CAST(N'2011-03-27T20:18:44.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (12, N'http://blog.coldbox.org/post.cfm/coldbox-connection-recordings-page', N'ColdBox Connection Recordings Page', N'We just created our new recordings page for the ColdBox Connection today, so you can get in one location all of the recordings.&nbsp; Hopefully in the near future we will expand it with tags and search.', CAST(N'2011-03-25T11:36:08.0000000' AS DateTime2), CAST(N'2011-03-25T11:36:08.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (13, N'http://blog.coldbox.org/post.cfm/coldbox-connection-recording-coldbox-modules', N'ColdBox Connection Recording: ColdBox Modules', N'Thanks for attending our 2nd ColdBox Connection webinar today!&nbsp; This webinar focused on ColdBox modules, modularity and architecture.&nbsp; Thanks go to Curt Gratz for presenting such excellent topic.&nbsp; Here is the recording for the show and also please note that we will have another show March 3.0!', CAST(N'2011-03-24T11:41:53.0000000' AS DateTime2), CAST(N'2011-03-24T11:41:53.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (14, N'http://blog.coldbox.org/post.cfm/coldbox-connection-thursday-modules', N'ColdBox Connection Thursday: Modules', N'Just a reminder that our ColdBox Connection Show continues this Thursday at 9 AM PST! Curt Gratz will be presenting on ColdBox Modules and of course we will all be there for questions and help. See you there!Location: http://experts.adobeconnect.com/coldbox-connection/Our full calendar of events can be found here: http://coldbox.org/about/eventscalendar', CAST(N'2011-03-22T08:48:10.0000000' AS DateTime2), CAST(N'2011-03-22T08:48:10.0000000' AS DateTime2), 0x01, 1)
INSERT [dbo].[blogentries] ([blogEntriesID], [blogEntriesLink], [blogEntriesTitle], [blogEntriesDescription], [blogEntriesDatePosted], [blogEntriesdateUpdated], [blogEntriesIsActive], [blogsID]) VALUES (15, N'http://blog.coldbox.org/post.cfm/coldbox-relax-v1-4-released', N'ColdBox Relax v1.4 released!', N'Here is a cool new update for ColdBox Relax - RESTful Tools For Lazy Experts!&nbsp; This update fixes a few issues reported and also enhances the Relaxer console and updates its ability to support definitions for multiple tiers and much more. So download it now!
Here are the closed issues for this release:

  #14 api_logs direct usage reference removed fixes
      #15 basic http authentication added to relaxer console so you can easily hit resources that require basic auth
      #10 entry points can now be a structure of name value pairs for multiple tiers
   #16 new browser results tab window to show how the results are rendered by a browser
      #17 addition http proxy as advanced settings to relaxer console so you can proxy your relaxed requests
      #11 Route Auto Generation - Method security fixes so implicit structures are generated alongside json structures

Here is also a nice screencast showcasing version 1.4 capabilities:
&nbsp;




What is Relax? ColdBox Relax is a set of RESTful tools for lazy experts.   We pride ourselves in helping developers work smarter and of course  document more in less time by providing them the necessary tools to  automagically document and test.  ColdBox Relax is a way to describe  RESTful web services, test RESTful web services, monitor RESTful web  services and document RESTful web services. The following introductory video will explain it better than words!
&nbsp;



So what are you waiting for? Get Relax Now!

  Source Code
  Download
  Documentation


', CAST(N'2011-03-21T16:51:09.0000000' AS DateTime2), CAST(N'2011-03-21T16:51:09.0000000' AS DateTime2), 0x01, 1)
SET IDENTITY_INSERT [dbo].[blogentries] OFF
SET IDENTITY_INSERT [dbo].[blogs] ON

INSERT [dbo].[blogs] ([blogsID], [blogsURL], [blogsWebsiteurl], [blogslanguage], [blogsTitle], [blogsDescription], [blogsdateBuilt], [blogsdateSumitted], [blogsIsActive], [blogsAuthorname], [blogsauthorEmail], [blogsauthorURL]) VALUES (1, N'http://blog.coldbox.org/feeds/rss.cfm', N'http://blog.coldbox.org/', N'', N'ColdBox Platform', N'The official ColdBox Blog', CAST(N'2011-04-08T15:19:13.0000000' AS DateTime2), CAST(N'2011-04-08T15:19:13.0000000' AS DateTime2), 0x01, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[blogs] OFF
INSERT [dbo].[cachebox] ([id], [objectKey], [objectValue], [hits], [timeout], [lastAccessTimeout], [created], [lastAccessed], [isExpired], [isSimple]) VALUES (N'DF658A103F07DC012AB905014C32D4C7', N'myKey', N'hello', 1, 0, 0, CAST(N'2016-02-25T16:34:00.0000000' AS DateTime2), CAST(N'2016-02-25T16:34:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'Presentations', N'<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Lucida Grande; color: #333333">Presso</p>', CAST(N'2011-02-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'40288110380cda3301382644c7f90008', N'LM', N'LM<br>', CAST(N'2012-06-10T23:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'402881882814615e012826481061000c', N'Marc', N'This is marcs category<br>', CAST(N'2010-04-21T22:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'402881882814615e01282bb047fd001e', N'Cool Wow', N'A cool wow category<br>', CAST(N'2010-04-22T22:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'402881882b89b49b012b9201bda80002', N'PascalNews', N'PascalNews', CAST(N'2010-10-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'402881a144f57bfd0144fa47bf040007', N'ads', N'asdf', CAST(N'2014-01-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'Release', N'<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Lucida Grande; color: #333333">Releases</p>', CAST(N'2009-04-18T11:48:53.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'88B689EA-B1C0-8EEF-143A84813ACADA35', N'general', N'A general category', CAST(N'2010-03-31T12:53:21.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'88B689EA-B1C0-8EEF-143A84813BCADA35', N'general', N'A second test general category', CAST(N'2010-03-31T12:53:21.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'88B6C087-F37E-7432-A13A84D45A0F703B', N'News', N'A news cateogyr', CAST(N'2009-04-18T11:48:53.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'99fc94fd3b98c834013b98c9b2140002', N'Fancy', N'Fancy Editor<br>', CAST(N'2012-12-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'99fc94fd3b9a459d013b9db89c060002', N'Markus', N'Hello Markus<br>', CAST(N'2012-12-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'A13C0DB0-0CBC-4D85-A5261F2E3FCBEF91', N'Training', N'unittest', CAST(N'2014-05-07T19:05:21.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'ff80808128c9fa8b0128cc3af5d90007', N'Geeky Stuff', N'Geeky Stuff', CAST(N'2010-05-25T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'ff80808128c9fa8b0128cc3b20bf0008', N'ColdBox', N'ColdBox', CAST(N'2010-05-23T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[categories] ([category_id], [category], [description], [modifydate], [testValue]) VALUES (N'ff80808128c9fa8b0128cc3b7cdd000a', N'ColdFusion', N'ColdFusion', CAST(N'2010-05-23T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'40288110380cda330138265bf9c4000a', N'8a64b3712e3a0a5e012e3a11a2cf0004', N'tt', CAST(N'2012-06-12T23:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'40288110380cda3301382c7fe50d0012', N'88B82629-B264-B33E-D1A144F97641614E', N'Test', CAST(N'2012-06-06T23:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'402881882814615e01282b13bbc20013', N'88B82629-B264-B33E-D1A144F97641614E', N'This entire blog post really offended me, I hate you', CAST(N'2010-04-22T22:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'402881882814615e01282b13fb290014', N'88B82629-B264-B33E-D1A144F97641614E', N'Why are you so hurtful man!', CAST(N'2010-04-22T22:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'402881882814615e01282b142cc60015', N'88B82629-B264-B33E-D1A144F97641614E', N'La realidad, que barbaro!', CAST(N'2010-04-22T22:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'88B8C6C7-DFB7-0F34-C2B0EFA4E5D7DA4C', N'88B82629-B264-B33E-D1A144F97641614E', N'this blog sucks.', CAST(N'2010-09-02T11:39:04.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'8a64b3712e3a0a5e012e3a10321d0002', N'402881882814615e01282b14964d0016', N'Vlad is awesome!', CAST(N'2011-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([comment_id], [FKentry_id], [comment], [time]) VALUES (N'8a64b3712e3a0a5e012e3a12b1d10005', N'8a64b3712e3a0a5e012e3a11a2cf0004', N'Vlad is awesome!', CAST(N'2011-02-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[contact] ON

INSERT [dbo].[contact] ([id], [firstName], [lastName], [email]) VALUES (1, N'Luis', N'Majano', N'lmajano@ortussolutions.com')
INSERT [dbo].[contact] ([id], [firstName], [lastName], [email]) VALUES (2, N'Jorge', N'Reyes', N'lmajano@gmail.com')
INSERT [dbo].[contact] ([id], [firstName], [lastName], [email]) VALUES (3, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[contact] OFF
INSERT [dbo].[entries] ([entry_id], [entryBody], [title], [postedDate], [FKuser_id]) VALUES (N'402881882814615e01282b14964d0016', N'Wow, welcome to my new blog, enjoy your stay<br>', N'My awesome post', CAST(N'2010-04-22T22:00:00.000' AS DateTime), N'88B73A03-FEFA-935D-AD8036E1B7954B76')
INSERT [dbo].[entries] ([entry_id], [entryBody], [title], [postedDate], [FKuser_id]) VALUES (N'88B82629-B264-B33E-D1A144F97641614E', N'A first cool blog,hope it does not crash', N'A cool blog first posting', CAST(N'2009-04-08T00:00:00.000' AS DateTime), N'88B73A03-FEFA-935D-AD8036E1B7954B76')
INSERT [dbo].[entries] ([entry_id], [entryBody], [title], [postedDate], [FKuser_id]) VALUES (N'8a64b3712e3a0a5e012e3a11a2cf0004', N'ContentBox is a professional open source modular content management engine that allows you to easily build websites adfsadf adfsadf asfddasfddasfddasfdd', N'My First Awesome Post My First Awesome Post', CAST(N'2013-04-16T22:00:00.000' AS DateTime), N'88B73A03-FEFA-935D-AD8036E1B7954B76')
INSERT [dbo].[entries] ([entry_id], [entryBody], [title], [postedDate], [FKuser_id]) VALUES (N'8aee965b3cfff278013d0007d9540002', N'<span>Mobile browsing popularity is skyrocketing. &nbsp;According to a <a href="http://www.nbcnews.com/technology/technolog/25-percent-use-smartphones-not-computers-majority-web-surfing-122259">new Pew Internet Project report</a>, 25% of Americans use smartphones instead of computers for the majority of their web browsing.</span>
<span>Missing out on <a href="http://guavabox.com/3-ways-to-get-started-with-mobile-marketing/">the mobile marketing trend</a>&nbsp;is
 likely to translate into loss of market share and decreased sales.
That’s not to say that it’s right for every business, but you at least
need to consider your target market persona before simply dismissing
mobile as a fad.</span>
One simple step you can take in the mobile direction is to learn how to add Apple icons to your website.
<h2>What Are Apple Icons &amp; Why Use Them?</h2>
<span><a href="http://guavabox.com/wp-content/uploads/2013/02/guavabox-apple-icon.png"><img src="http://guavabox.com/wp-content/uploads/2013/02/guavabox-apple-icon.png" alt="GuavaBox Apple Icon Example" height="246" width="307"></a>Apple
 Icons are simply the graphics you’ve chosen to represent your site when
 a user saves your page to their home screen in iOS.</span>
If you don’t have Apple Icons created for your site, iOS grabs a
compressed thumbnail of your website and displays it as the icon. &nbsp;The
result is typically indistinguishable and unappealing.
Apple Icons are an awesome branding opportunity and give you the chance to g<br>', N'Test', CAST(N'2013-04-23T00:00:00.000' AS DateTime), N'402884cc310b1ae901311be89381000a')
INSERT [dbo].[entries] ([entry_id], [entryBody], [title], [postedDate], [FKuser_id]) VALUES (N'99fc94fd3ba7f266013bad4a8a3b0004', N'This is my first blog post from Bern!<br>', N'This is my first blog post from Bern!', CAST(N'2012-12-17T15:00:00.000' AS DateTime), N'99fc94fd3ba7f266013bad49e3c50003')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'88B689EA-B1C0-8EEF-143A84813ACADA35', N'88B82629-B264-B33E-D1A144F97641614E')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'88B6C087-F37E-7432-A13A84D45A0F703B', N'88B82629-B264-B33E-D1A144F97641614E')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'99fc94fd3ba7f266013bad4a8a3b0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'99fc94fd3ba7f266013bad4a8a3b0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'99fc94fd3b98c834013b98c9b2140002', N'99fc94fd3ba7f266013bad4a8a3b0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'40288110380cda3301382644c7f90008', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'402881882b89b49b012b9201bda80002', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'99fc94fd3b98c834013b98c9b2140002', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'8a64b3712e3a0a5e012e3a11a2cf0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'A13C0DB0-0CBC-4D85-A5261F2E3FCBEF91', N'8a64b3712e3a0a5e012e3a11a2cf0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'8a64b3712e3a0a5e012e3a11a2cf0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'88B689EA-B1C0-8EEF-143A84813ACADA35', N'88B82629-B264-B33E-D1A144F97641614E')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'88B6C087-F37E-7432-A13A84D45A0F703B', N'88B82629-B264-B33E-D1A144F97641614E')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'99fc94fd3ba7f266013bad4a8a3b0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'99fc94fd3ba7f266013bad4a8a3b0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'99fc94fd3b98c834013b98c9b2140002', N'99fc94fd3ba7f266013bad4a8a3b0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'40288110380cda3301382644c7f90008', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'402881882b89b49b012b9201bda80002', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'99fc94fd3b98c834013b98c9b2140002', N'402881882814615e01282b14964d0016')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'5898F818-A9B6-4F5D-96FE70A31EBB78AC', N'8a64b3712e3a0a5e012e3a11a2cf0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'A13C0DB0-0CBC-4D85-A5261F2E3FCBEF91', N'8a64b3712e3a0a5e012e3a11a2cf0004')
INSERT [dbo].[entry_categories] ([FKcategory_id], [FKentry_id]) VALUES (N'3A2C516C-41CE-41D3-A9224EA690ED1128', N'8a64b3712e3a0a5e012e3a11a2cf0004')
SET IDENTITY_INSERT [dbo].[roles] ON

INSERT [dbo].[roles] ([roleID], [role]) VALUES (1, N'Administrator')
INSERT [dbo].[roles] ([roleID], [role]) VALUES (2, N'Moderator')
INSERT [dbo].[roles] ([roleID], [role]) VALUES (3, N'Anonymous')
INSERT [dbo].[roles] ([roleID], [role]) VALUES (4, N'Super User')
INSERT [dbo].[roles] ([roleID], [role]) VALUES (5, N'Editor')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[todo] ON

INSERT [dbo].[todo] ([blogsID], [name]) VALUES (1, N'AL-{ts ''2011-04-07 11:15:55''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (2, N'AL-{ts ''2011-04-07 11:16:22''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (3, N'AL-{ts ''2011-04-07 11:17:06''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (4, N'AL-{ts ''2011-04-07 11:21:52''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (5, N'AL-{ts ''2011-04-07 11:23:06''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (6, N'AL-{ts ''2011-04-07 11:23:08''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (7, N'AL-{ts ''2011-04-18 17:23:59''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (8, N'AL-{ts ''2011-04-18 17:37:15''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (9, N'AL-{ts ''2011-04-18 17:37:20''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (10, N'AL-{ts ''2011-04-18 17:38:06''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (11, N'AL-{ts ''2011-04-18 17:38:08''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (12, N'AL-{ts ''2011-04-18 17:38:09''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (13, N'AL-{ts ''2011-04-18 17:38:10''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (14, N'AL-{ts ''2011-04-18 17:38:11''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (15, N'AL-{ts ''2011-04-18 17:38:12''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (16, N'AL-{ts ''2011-04-18 17:38:14''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (17, N'AL-{ts ''2011-04-18 17:38:15''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (18, N'AL-{ts ''2011-04-18 17:38:16''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (19, N'AL-{ts ''2011-04-18 17:38:17''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (20, N'AL-{ts ''2011-04-18 17:38:18''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (21, N'AL-{ts ''2011-04-18 17:38:19''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (22, N'AL-{ts ''2011-04-18 17:38:20''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (23, N'AL-{ts ''2011-04-18 17:38:21''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (24, N'AL-{ts ''2011-04-18 17:40:41''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (25, N'AL-{ts ''2011-04-18 17:40:44''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (26, N'AL-{ts ''2011-04-18 17:40:47''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (27, N'AL-{ts ''2011-04-18 17:41:38''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (28, N'AL-{ts ''2011-04-18 17:44:15''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (29, N'AL-{ts ''2011-04-18 17:44:25''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (30, N'AL-{ts ''2011-04-18 17:44:39''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (31, N'AL-{ts ''2011-04-18 17:49:44''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (32, N'AL-{ts ''2011-04-18 17:50:10''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (33, N'AL-{ts ''2011-04-18 17:51:07''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (34, N'AL-{ts ''2011-04-18 17:57:44''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (35, N'AL-{ts ''2011-04-18 18:03:33''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (36, N'AL-{ts ''2011-04-18 19:32:04''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (37, N'AL-{ts ''2011-04-18 19:32:08''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (38, N'AL-{ts ''2011-04-18 19:32:31''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (39, N'AL-{ts ''2011-04-18 19:32:51''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (40, N'AL-{ts ''2011-04-18 20:02:55''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (41, N'AL-{ts ''2011-04-18 20:03:52''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (42, N'AL-{ts ''2011-04-18 20:04:10''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (43, N'AL-{ts ''2011-04-18 20:12:52''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (44, N'AL-{ts ''2011-04-19 15:43:36''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (45, N'AL-{ts ''2011-04-19 15:44:20''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (46, N'AL-{ts ''2011-04-19 15:48:26''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (47, N'AL-{ts ''2011-04-19 15:50:59''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (48, N'AL-{ts ''2011-04-19 15:51:08''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (49, N'AL-{ts ''2011-04-19 15:51:15''}')
INSERT [dbo].[todo] ([blogsID], [name]) VALUES (50, N'AL-{ts ''2011-04-23 12:58:04''}')
SET IDENTITY_INSERT [dbo].[todo] OFF
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'4028818e2fb6c893012fe637c5db00a7', N'George', N'Form Injector', N'george', N'george', NULL, 2, 0x01)
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'402884cc310b1ae901311be89381000a', N'ken', N'Advanced Guru', N'kenneth', N'smith', CAST(N'2014-03-25T00:00:00.0000000' AS DateTime2), 2, 0x01)
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'4A386F4D-DCF4-6587-7B89B3BD57C97155', N'Joe', N'Fernando', N'joe', N'joe', CAST(N'2009-05-15T00:00:00.0000000' AS DateTime2), 1, 0x01)
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'88B73A03-FEFA-935D-AD8036E1B7954B76', N'Luis', N'Majano', N'lui', N'lmajano', CAST(N'2009-04-08T00:00:00.0000000' AS DateTime2), 1, 0x01)
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'8a64b3712e3a0a5e012e3a110fab0003', N'Vladymir', N'Ugryumov', N'vlad', N'vlad', CAST(N'2011-02-18T00:00:00.0000000' AS DateTime2), 1, 0x01)
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'99fc94fd3b98c834013b98c928120001', N'Juerg', N'Anderegg', N'juerg', N'juerg', CAST(N'2012-12-14T00:00:00.0000000' AS DateTime2), NULL, 0x01)
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [FKRoleID], [isActive]) VALUES (N'99fc94fd3ba7f266013bad49e3c50003', N'Tanja', N'Zogg', N'tanja', N'tanja', CAST(N'2012-12-18T00:00:00.0000000' AS DateTime2), NULL, 0x01)
/****** Object:  Index [FK2828728E45296FD]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FK2828728E45296FD] ON [dbo].[blogentries]
(
	[blogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FK_comments_1]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FK_comments_1] ON [dbo].[comments]
(
	[FKentry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FKentry_id]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FKentry_id] ON [dbo].[comments]
(
	[FKentry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FKuser_id]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FKuser_id] ON [dbo].[entries]
(
	[FKuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FKcategory_id]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FKcategory_id] ON [dbo].[entry_categories]
(
	[FKcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FKentry_id]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FKentry_id] ON [dbo].[entry_categories]
(
	[FKentry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKRoleID]    Script Date: 12/14/2016 1:40:29 PM ******/
CREATE NONCLUSTERED INDEX [FKRoleID] ON [dbo].[users]
(
	[FKRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blogentries] ADD  DEFAULT (NULL) FOR [blogsID]
GO
ALTER TABLE [dbo].[blogs] ADD  DEFAULT (NULL) FOR [blogsAuthorname]
GO
ALTER TABLE [dbo].[blogs] ADD  DEFAULT (NULL) FOR [blogsauthorEmail]
GO
ALTER TABLE [dbo].[cachebox] ADD  DEFAULT ((1)) FOR [hits]
GO
ALTER TABLE [dbo].[cachebox] ADD  DEFAULT ((1)) FOR [isExpired]
GO
ALTER TABLE [dbo].[cachebox] ADD  DEFAULT ((0)) FOR [isSimple]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT (getdate()) FOR [modifydate]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT (NULL) FOR [testValue]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT (NULL) FOR [firstName]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT (NULL) FOR [lastName]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[entries] ADD  DEFAULT (getdate()) FOR [postedDate]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [role]
GO
ALTER TABLE [dbo].[todo] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [lastLogin]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [FKRoleID]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (0x01) FOR [isActive]
GO
ALTER TABLE [dbo].[blogentries]  WITH NOCHECK ADD  CONSTRAINT [blogentries$FK2828728E45296FD] FOREIGN KEY([blogsID])
REFERENCES [dbo].[blogs] ([blogsID])
GO
ALTER TABLE [dbo].[blogentries] CHECK CONSTRAINT [blogentries$FK2828728E45296FD]
GO
ALTER TABLE [dbo].[comments]  WITH NOCHECK ADD  CONSTRAINT [comments$comments_ibfk_1] FOREIGN KEY([FKentry_id])
REFERENCES [dbo].[entries] ([entry_id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [comments$comments_ibfk_1]
GO
ALTER TABLE [dbo].[entry_categories]  WITH NOCHECK ADD  CONSTRAINT [entry_categories$entry_categories_ibfk_1] FOREIGN KEY([FKcategory_id])
REFERENCES [dbo].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[entry_categories] CHECK CONSTRAINT [entry_categories$entry_categories_ibfk_1]
GO
ALTER TABLE [dbo].[entry_categories]  WITH NOCHECK ADD  CONSTRAINT [entry_categories$entry_categories_ibfk_2] FOREIGN KEY([FKentry_id])
REFERENCES [dbo].[entries] ([entry_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[entry_categories] CHECK CONSTRAINT [entry_categories$entry_categories_ibfk_2]
GO
ALTER TABLE [dbo].[users]  WITH NOCHECK ADD  CONSTRAINT [users$users_ibfk_1] FOREIGN KEY([FKRoleID])
REFERENCES [dbo].[roles] ([roleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users$users_ibfk_1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.blogentries' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blogentries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.blogs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.cachebox' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cachebox'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.categories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'categories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.contact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.entries' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.entry_categories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entry_categories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.logs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'logs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.relax_logs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relax_logs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.roles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.todo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'todo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'coolblog.users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'users'
GO
USE [master]
GO
ALTER DATABASE [coolblog] SET  READ_WRITE
GO
