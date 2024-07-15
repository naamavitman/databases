prompt Creating PERSON...
create table PERSON
(
  person_id INTEGER not null,
  name      VARCHAR2(100) not null,
  email     VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERSON
  add primary key (PERSON_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating COMMUNITY_COMPANY...
create table COMMUNITY_COMPANY
(
  person_id INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMMUNITY_COMPANY
  add primary key (PERSON_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMMUNITY_COMPANY
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating PRODUCT...
create table PRODUCT
(
  type           VARCHAR2(50) not null,
  product_number INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add primary key (PRODUCT_NUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating COMMUNITY_COMPANY_PRODUCT...
create table COMMUNITY_COMPANY_PRODUCT
(
  receive_date   DATE not null,
  quantity       INTEGER not null,
  person_id      INTEGER not null,
  product_number INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMMUNITY_COMPANY_PRODUCT
  add primary key (PERSON_ID, PRODUCT_NUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMMUNITY_COMPANY_PRODUCT
  add foreign key (PERSON_ID)
  references COMMUNITY_COMPANY (PERSON_ID);
alter table COMMUNITY_COMPANY_PRODUCT
  add foreign key (PRODUCT_NUMBER)
  references PRODUCT (PRODUCT_NUMBER);

prompt Creating DONOR...
create table DONOR
(
  person_id INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR
  add primary key (PERSON_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating CONTRIBUTION...
create table CONTRIBUTION
(
  contribution_date DATE not null,
  donation_number   INTEGER not null,
  person_id         INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CONTRIBUTION
  add primary key (DONATION_NUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CONTRIBUTION
  add foreign key (PERSON_ID)
  references DONOR (PERSON_ID);

prompt Creating FINANCIAL_CONTRIBUTION...
create table FINANCIAL_CONTRIBUTION
(
  amount          NUMBER(10,2) not null,
  payment_method  VARCHAR2(50) not null,
  donation_number INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FINANCIAL_CONTRIBUTION
  add primary key (DONATION_NUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FINANCIAL_CONTRIBUTION
  add foreign key (DONATION_NUMBER)
  references CONTRIBUTION (DONATION_NUMBER);

prompt Creating PRODUCT_DONATION...
create table PRODUCT_DONATION
(
  donation_number INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_DONATION
  add primary key (DONATION_NUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_DONATION
  add foreign key (DONATION_NUMBER)
  references CONTRIBUTION (DONATION_NUMBER);

prompt Creating PRODUCT_DONATION_DETAILS...
create table PRODUCT_DONATION_DETAILS
(
  amount_of_items INTEGER not null,
  donation_number INTEGER not null,
  product_number  INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_DONATION_DETAILS
  add primary key (DONATION_NUMBER, PRODUCT_NUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_DONATION_DETAILS
  add foreign key (DONATION_NUMBER)
  references PRODUCT_DONATION (DONATION_NUMBER);
alter table PRODUCT_DONATION_DETAILS
  add foreign key (PRODUCT_NUMBER)
  references PRODUCT (PRODUCT_NUMBER);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for COMMUNITY_COMPANY...
alter table COMMUNITY_COMPANY disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for COMMUNITY_COMPANY_PRODUCT...
alter table COMMUNITY_COMPANY_PRODUCT disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for CONTRIBUTION...
alter table CONTRIBUTION disable all triggers;
prompt Disabling triggers for FINANCIAL_CONTRIBUTION...
alter table FINANCIAL_CONTRIBUTION disable all triggers;
prompt Disabling triggers for PRODUCT_DONATION...
alter table PRODUCT_DONATION disable all triggers;
prompt Disabling triggers for PRODUCT_DONATION_DETAILS...
alter table PRODUCT_DONATION_DETAILS disable all triggers;
prompt Disabling foreign key constraints for COMMUNITY_COMPANY...
alter table COMMUNITY_COMPANY disable constraint SYS_C00721698;
prompt Disabling foreign key constraints for COMMUNITY_COMPANY_PRODUCT...
alter table COMMUNITY_COMPANY_PRODUCT disable constraint SYS_C00721707;
alter table COMMUNITY_COMPANY_PRODUCT disable constraint SYS_C00721708;
prompt Disabling foreign key constraints for DONOR...
alter table DONOR disable constraint SYS_C00721695;
prompt Disabling foreign key constraints for CONTRIBUTION...
alter table CONTRIBUTION disable constraint SYS_C00721713;
prompt Disabling foreign key constraints for FINANCIAL_CONTRIBUTION...
alter table FINANCIAL_CONTRIBUTION disable constraint SYS_C00721718;
prompt Disabling foreign key constraints for PRODUCT_DONATION...
alter table PRODUCT_DONATION disable constraint SYS_C00721721;
prompt Disabling foreign key constraints for PRODUCT_DONATION_DETAILS...
alter table PRODUCT_DONATION_DETAILS disable constraint SYS_C00721726;
alter table PRODUCT_DONATION_DETAILS disable constraint SYS_C00721727;
prompt Deleting PRODUCT_DONATION_DETAILS...
delete from PRODUCT_DONATION_DETAILS;
commit;
prompt Deleting PRODUCT_DONATION...
delete from PRODUCT_DONATION;
commit;
prompt Deleting FINANCIAL_CONTRIBUTION...
delete from FINANCIAL_CONTRIBUTION;
commit;
prompt Deleting CONTRIBUTION...
delete from CONTRIBUTION;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting COMMUNITY_COMPANY_PRODUCT...
delete from COMMUNITY_COMPANY_PRODUCT;
commit;
prompt Deleting PRODUCT...
delete from PRODUCT;
commit;
prompt Deleting COMMUNITY_COMPANY...
delete from COMMUNITY_COMPANY;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (person_id, name, email)
values (14510965, 'Albertina', 'albertinac@advertisingventures.com');
insert into PERSON (person_id, name, email)
values (11092943, 'Yaphet', 'yaphet.holmes@portageenvironmental.at');
insert into PERSON (person_id, name, email)
values (73165619, 'Elisabeth', 'elisabethi@valleyoaksystems.com');
insert into PERSON (person_id, name, email)
values (34095433, 'Natasha', 'natasha.cummings@gci.com');
insert into PERSON (person_id, name, email)
values (56090616, 'Stewart', 'stewart.s@accuship.de');
insert into PERSON (person_id, name, email)
values (77829844, 'Beth', 'beth.d@activeservices.jp');
insert into PERSON (person_id, name, email)
values (71762122, 'Candice', 'candice.b@execuscribe.it');
insert into PERSON (person_id, name, email)
values (3987643, 'Peabo', 'peabo.lillard@ceom.uk');
insert into PERSON (person_id, name, email)
values (27192860, 'Liam', 'liam.zetajones@mosaic.com');
insert into PERSON (person_id, name, email)
values (56903323, 'Vern', 'vern.schiff@paisley.jp');
insert into PERSON (person_id, name, email)
values (21196205, 'Robbie', 'robbie.crewson@accessus.com');
insert into PERSON (person_id, name, email)
values (73713988, 'Henry', 'henry.wheel@base.nl');
insert into PERSON (person_id, name, email)
values (78240894, 'Avenged', 'avenged.savage@progressivedesigns.com');
insert into PERSON (person_id, name, email)
values (6829749, 'Maury', 'maury.duchovny@royalgold.com');
insert into PERSON (person_id, name, email)
values (1993362, 'Liev', 'liev.berkeley@voicelog.com');
insert into PERSON (person_id, name, email)
values (101256160, 'Shannon', 'shannonc@glacierbancorp.com');
insert into PERSON (person_id, name, email)
values (5008495, 'Simon', 'stomei@hewlettpackard.com');
insert into PERSON (person_id, name, email)
values (6047315, 'Franco', 'franco@adolph.com');
insert into PERSON (person_id, name, email)
values (75976526, 'Judge', 'judge@totalentertainment.it');
insert into PERSON (person_id, name, email)
values (93793983, 'Stephanie', 'stephanie.g@mission.com');
insert into PERSON (person_id, name, email)
values (66717035, 'Jann', 'jann.f@nsd.com');
insert into PERSON (person_id, name, email)
values (58689251, 'Tracy', 'tracy.flanery@capellaeducation.is');
insert into PERSON (person_id, name, email)
values (37467028, 'Kelly', 'kelly.levy@asapstaffing.de');
insert into PERSON (person_id, name, email)
values (50370541, 'Ceili', 'ceiliv@cendant.au');
insert into PERSON (person_id, name, email)
values (79803736, 'Sandra', 'sandra.lithgow@netnumina.com');
insert into PERSON (person_id, name, email)
values (32082517, 'Glen', 'gkennedy@mag.ch');
insert into PERSON (person_id, name, email)
values (105949438, 'Vincent', 'vincent.kravitz@ibfh.ch');
insert into PERSON (person_id, name, email)
values (99754753, 'Bob', 'b.hurley@activeservices.ca');
insert into PERSON (person_id, name, email)
values (28539345, 'Laura', 'laura.costner@scjohnson.de');
insert into PERSON (person_id, name, email)
values (72824709, 'George', 'george.jane@conquestsystems.com');
insert into PERSON (person_id, name, email)
values (84781227, 'Joe', 'joe.gallagher@ataservices.com');
insert into PERSON (person_id, name, email)
values (57168055, 'Anthony', 'anthonyp@universalsolutions.com');
insert into PERSON (person_id, name, email)
values (46623389, 'Maggie', 'maggie.h@als.com');
insert into PERSON (person_id, name, email)
values (80143976, 'Benjamin', 'b.mcgoohan@gltg.be');
insert into PERSON (person_id, name, email)
values (57602660, 'Percy', 'percy.burrows@maverick.au');
insert into PERSON (person_id, name, email)
values (84413881, 'Sydney', 'sydney@dbprofessionals.de');
insert into PERSON (person_id, name, email)
values (60179622, 'Isaiah', 'ishandling@grt.nl');
insert into PERSON (person_id, name, email)
values (68121942, 'Angela', 'angela.plummer@grayhawksystems.ch');
insert into PERSON (person_id, name, email)
values (6065173, 'Toshiro', 'toshiros@networkdisplay.de');
insert into PERSON (person_id, name, email)
values (90817114, 'Nicolas', 'nicolas.hall@ogiointernational.hk');
insert into PERSON (person_id, name, email)
values (66532109, 'Rob', 'r.green@parksite.com');
insert into PERSON (person_id, name, email)
values (7737380, 'Catherine', 'catherine.pesci@privatebancorp.dk');
insert into PERSON (person_id, name, email)
values (1311179, 'Humberto', 'humberto.r@streetglow.com');
insert into PERSON (person_id, name, email)
values (10368669, 'Dan', 'dan@evergreenresources.com');
insert into PERSON (person_id, name, email)
values (105412577, 'Temuera', 'temuera.s@learningvoyage.ar');
insert into PERSON (person_id, name, email)
values (37010762, 'Joanna', 'joanna.fehr@horizonorganic.de');
insert into PERSON (person_id, name, email)
values (17496004, 'Wade', 'wade.vanian@nike.de');
insert into PERSON (person_id, name, email)
values (50683650, 'Davy', 'davy.johansson@kramontrealty.com');
insert into PERSON (person_id, name, email)
values (72377496, 'Joey', 'joey.hayek@tmt.com');
insert into PERSON (person_id, name, email)
values (13780159, 'Carrie', 'carrie.l@trainersoft.com');
insert into PERSON (person_id, name, email)
values (87743778, 'Naomi', 'naomi.scaggs@news.za');
insert into PERSON (person_id, name, email)
values (52391980, 'Henry', 'henry.portman@talx.com');
insert into PERSON (person_id, name, email)
values (91097410, 'Oliver', 'oazaria@jma.de');
insert into PERSON (person_id, name, email)
values (75559692, 'Gordie', 'gkennedy@maverick.com');
insert into PERSON (person_id, name, email)
values (77567213, 'Bridget', 'bridget.calle@newtoninteractive.ee');
insert into PERSON (person_id, name, email)
values (81829842, 'Debbie', 'debbies@irissoftware.de');
insert into PERSON (person_id, name, email)
values (42137126, 'Josh', 'joshr@dvdt.com');
insert into PERSON (person_id, name, email)
values (103884176, 'Fionnula', 'fionnulaw@carteretmortgage.au');
insert into PERSON (person_id, name, email)
values (13903606, 'Lisa', 'lisa@datawarehouse.ca');
insert into PERSON (person_id, name, email)
values (88788655, 'Joan', 'joan.w@baesch.com');
insert into PERSON (person_id, name, email)
values (8391744, 'Brian', 'brian.mitchell@ultimus.com');
insert into PERSON (person_id, name, email)
values (1358637, 'Ali', 'ali.cleese@comglobalsystems.com');
insert into PERSON (person_id, name, email)
values (89672891, 'Rosco', 'roscok@teoco.com');
insert into PERSON (person_id, name, email)
values (63294045, 'Alex', 'a.stoltz@adeasolutions.com');
insert into PERSON (person_id, name, email)
values (43238558, 'Jody', 'jkidman@seafoxboat.fr');
insert into PERSON (person_id, name, email)
values (56766538, 'Denise', 'denise.rollins@oriservices.com');
insert into PERSON (person_id, name, email)
values (70628021, 'Eugene', 'eugene.mortensen@providentbancorp.jp');
insert into PERSON (person_id, name, email)
values (90719034, 'Fairuza', 'fairuza.coverdale@actechnologies.de');
insert into PERSON (person_id, name, email)
values (41347718, 'David', 'dcamp@aoe.ca');
insert into PERSON (person_id, name, email)
values (62837659, 'Denise', 'denise.assante@alogent.com');
insert into PERSON (person_id, name, email)
values (67598118, 'Dar', 'dar.preston@stonebrewing.com');
insert into PERSON (person_id, name, email)
values (82178434, 'Ritchie', 'ritchie@ceom.ar');
insert into PERSON (person_id, name, email)
values (40448789, 'Rosario', 'rosario.dreyfuss@aci.it');
insert into PERSON (person_id, name, email)
values (96150477, 'Mary', 'mary.callow@esoftsolutions.ca');
insert into PERSON (person_id, name, email)
values (5822205, 'Tea', 't.kutcher@eastmankodak.com');
insert into PERSON (person_id, name, email)
values (100768785, 'Rowan', 'rowan.theron@staffforce.com');
insert into PERSON (person_id, name, email)
values (67564929, 'Meg', 'm.vaughn@fordmotor.com');
insert into PERSON (person_id, name, email)
values (77036671, 'Miguel', 'miguel.mcbride@conquest.com');
insert into PERSON (person_id, name, email)
values (81836758, 'Mitchell', 'mitchell.s@hotmail.it');
insert into PERSON (person_id, name, email)
values (70324412, 'Leo', 'leo.wolf@democracydata.yu');
insert into PERSON (person_id, name, email)
values (45116851, 'Penelope', 'penelope.finney@smg.uk');
insert into PERSON (person_id, name, email)
values (87694494, 'Patricia', 'patricia.sisto@caliber.com');
insert into PERSON (person_id, name, email)
values (82039124, 'Danny', 'danny.schiavelli@sandyspringbancorp.com');
insert into PERSON (person_id, name, email)
values (11431074, 'Cary', 'cary.pollack@electricalsolutions.de');
insert into PERSON (person_id, name, email)
values (106248739, 'Angelina', 'angelina.spears@verizon.de');
insert into PERSON (person_id, name, email)
values (98154235, 'Joey', 'joey.borgnine@zaiqtechnologies.uk');
insert into PERSON (person_id, name, email)
values (89163406, 'Alice', 'alice.rooker@ams.com');
insert into PERSON (person_id, name, email)
values (110788739, 'Fiona', 'fiona.f@alogent.uk');
insert into PERSON (person_id, name, email)
values (16421434, 'Belinda', 'b.shannon@nha.com');
insert into PERSON (person_id, name, email)
values (78101803, 'Samantha', 'samantha@visainternational.com');
insert into PERSON (person_id, name, email)
values (20645185, 'Doug', 'doug.spader@newhorizons.at');
insert into PERSON (person_id, name, email)
values (3494711, 'Rik', 'rik@investorstitle.in');
insert into PERSON (person_id, name, email)
values (40637861, 'Jodie', 'jodie.griffin@generalelectric.com');
insert into PERSON (person_id, name, email)
values (10645277, 'Debra', 'debra@hps.uk');
insert into PERSON (person_id, name, email)
values (37506895, 'Crystal', 'crystal.vanhelden@generalmotors.com');
insert into PERSON (person_id, name, email)
values (15110158, 'Jodie', 'jodie.wolf@saksinc.mo');
insert into PERSON (person_id, name, email)
values (43543010, 'Gerald', 'gerald.b@nrae.at');
insert into PERSON (person_id, name, email)
values (79149394, 'Julie', 'jdooley@hps.com');
insert into PERSON (person_id, name, email)
values (7216369, 'Ahmad', 'awesterberg@team.ca');
insert into PERSON (person_id, name, email)
values (47396884, 'Sander', 'sanderd@denaliventures.com');
commit;
prompt 100 records committed...
insert into PERSON (person_id, name, email)
values (8772738, 'Andie', 'a.geldof@hitechpharmacal.ch');
insert into PERSON (person_id, name, email)
values (11327568, 'Allan', 'a.pierce@tastefullysimple.de');
insert into PERSON (person_id, name, email)
values (66867636, 'Kelli', 'k.neil@pharmacia.it');
insert into PERSON (person_id, name, email)
values (11246750, 'Reese', 'r.aaron@meghasystems.com');
insert into PERSON (person_id, name, email)
values (16241032, 'Lisa', 'lisa.d@esoftsolutions.ca');
insert into PERSON (person_id, name, email)
values (20142625, 'Joan', 'joan.popper@innovateecommerce.com');
insert into PERSON (person_id, name, email)
values (82561239, 'Tzi', 'tzi@sps.de');
insert into PERSON (person_id, name, email)
values (80427381, 'Cliff', 'cliff.dushku@bioreference.com');
insert into PERSON (person_id, name, email)
values (110054452, 'Daryl', 'daryl.nugent@vitacostcom.com');
insert into PERSON (person_id, name, email)
values (62953781, 'Thelma', 'thelma.brock@sandyspringbancorp.com');
insert into PERSON (person_id, name, email)
values (45727388, 'Maria', 'marias@staffone.es');
insert into PERSON (person_id, name, email)
values (27251551, 'Brothers', 'brothers.aiken@ceom.it');
insert into PERSON (person_id, name, email)
values (24283842, 'Isaac', 'isaac.w@spd.nl');
insert into PERSON (person_id, name, email)
values (12013160, 'Zooey', 'zooey@tlsservicebureau.ca');
insert into PERSON (person_id, name, email)
values (23629623, 'Ann', 'ann.callow@jlphor.com');
insert into PERSON (person_id, name, email)
values (39401872, 'Jeffrey', 'jsossamon@tripwire.com');
insert into PERSON (person_id, name, email)
values (53608282, 'Rueben', 'rueben.vanshelton@bestbuy.at');
insert into PERSON (person_id, name, email)
values (6655732, 'Elijah', 'e.weller@isd.com');
insert into PERSON (person_id, name, email)
values (8964029, 'Shelby', 'shelby.avalon@ogi.com');
insert into PERSON (person_id, name, email)
values (39631364, 'Pelvic', 'p.loggins@democracydata.com');
insert into PERSON (person_id, name, email)
values (43782982, 'Philip', 'pblair@studiobproductions.il');
insert into PERSON (person_id, name, email)
values (43664826, 'Brendan', 'brendan.o@horizon.cr');
insert into PERSON (person_id, name, email)
values (33204044, 'Denzel', 'denzel@shufflemaster.com');
insert into PERSON (person_id, name, email)
values (2411032, 'Miranda', 'miranda.travers@ecopy.jp');
insert into PERSON (person_id, name, email)
values (10601070, 'Kris', 'kris.wen@nrae.ch');
insert into PERSON (person_id, name, email)
values (59557783, 'Chazz', 'chazzc@freedommedical.com');
insert into PERSON (person_id, name, email)
values (110338864, 'Alicia', 'alicia.galecki@vesta.au');
insert into PERSON (person_id, name, email)
values (66257486, 'Collin', 'collin.murdock@bioreliance.fr');
insert into PERSON (person_id, name, email)
values (4269372, 'Kim', 'kim.oldman@stiknowledge.jp');
insert into PERSON (person_id, name, email)
values (59482646, 'Lance', 'lance.t@nsd.com');
insert into PERSON (person_id, name, email)
values (123, ' person_123', ' person_123@example.com');
insert into PERSON (person_id, name, email)
values (1, ' person_1', ' person_1@example.com');
insert into PERSON (person_id, name, email)
values (2, ' person_2', ' person_2@example.com');
insert into PERSON (person_id, name, email)
values (3, ' person_3', ' person_3@example.com');
insert into PERSON (person_id, name, email)
values (4, ' person_4', ' person_4@example.com');
insert into PERSON (person_id, name, email)
values (5, ' person_5', ' person_5@example.com');
insert into PERSON (person_id, name, email)
values (6, ' person_6', ' person_6@example.com');
insert into PERSON (person_id, name, email)
values (7, ' person_7', ' person_7@example.com');
insert into PERSON (person_id, name, email)
values (8, ' person_8', ' person_8@example.com');
insert into PERSON (person_id, name, email)
values (9, ' person_9', ' person_9@example.com');
insert into PERSON (person_id, name, email)
values (10, ' person_10', ' person_10@example.com');
insert into PERSON (person_id, name, email)
values (11, ' person_11', ' person_11@example.com');
insert into PERSON (person_id, name, email)
values (12, ' person_12', ' person_12@example.com');
insert into PERSON (person_id, name, email)
values (13, ' person_13', ' person_13@example.com');
insert into PERSON (person_id, name, email)
values (14, ' person_14', ' person_14@example.com');
insert into PERSON (person_id, name, email)
values (15, ' person_15', ' person_15@example.com');
insert into PERSON (person_id, name, email)
values (16, ' person_16', ' person_16@example.com');
insert into PERSON (person_id, name, email)
values (17, ' person_17', ' person_17@example.com');
insert into PERSON (person_id, name, email)
values (18, ' person_18', ' person_18@example.com');
insert into PERSON (person_id, name, email)
values (19, ' person_19', ' person_19@example.com');
insert into PERSON (person_id, name, email)
values (20, ' person_20', ' person_20@example.com');
insert into PERSON (person_id, name, email)
values (21, ' person_21', ' person_21@example.com');
insert into PERSON (person_id, name, email)
values (22, ' person_22', ' person_22@example.com');
insert into PERSON (person_id, name, email)
values (23, ' person_23', ' person_23@example.com');
insert into PERSON (person_id, name, email)
values (24, ' person_24', ' person_24@example.com');
insert into PERSON (person_id, name, email)
values (25, ' person_25', ' person_25@example.com');
insert into PERSON (person_id, name, email)
values (26, ' person_26', ' person_26@example.com');
insert into PERSON (person_id, name, email)
values (27, ' person_27', ' person_27@example.com');
insert into PERSON (person_id, name, email)
values (28, ' person_28', ' person_28@example.com');
insert into PERSON (person_id, name, email)
values (29, ' person_29', ' person_29@example.com');
insert into PERSON (person_id, name, email)
values (30, ' person_30', ' person_30@example.com');
insert into PERSON (person_id, name, email)
values (31, ' person_31', ' person_31@example.com');
insert into PERSON (person_id, name, email)
values (32, ' person_32', ' person_32@example.com');
insert into PERSON (person_id, name, email)
values (33, ' person_33', ' person_33@example.com');
insert into PERSON (person_id, name, email)
values (34, ' person_34', ' person_34@example.com');
insert into PERSON (person_id, name, email)
values (35, ' person_35', ' person_35@example.com');
insert into PERSON (person_id, name, email)
values (36, ' person_36', ' person_36@example.com');
insert into PERSON (person_id, name, email)
values (37, ' person_37', ' person_37@example.com');
insert into PERSON (person_id, name, email)
values (38, ' person_38', ' person_38@example.com');
insert into PERSON (person_id, name, email)
values (39, ' person_39', ' person_39@example.com');
insert into PERSON (person_id, name, email)
values (40, ' person_40', ' person_40@example.com');
insert into PERSON (person_id, name, email)
values (41, ' person_41', ' person_41@example.com');
insert into PERSON (person_id, name, email)
values (42, ' person_42', ' person_42@example.com');
insert into PERSON (person_id, name, email)
values (43, ' person_43', ' person_43@example.com');
insert into PERSON (person_id, name, email)
values (44, ' person_44', ' person_44@example.com');
insert into PERSON (person_id, name, email)
values (45, ' person_45', ' person_45@example.com');
insert into PERSON (person_id, name, email)
values (46, ' person_46', ' person_46@example.com');
insert into PERSON (person_id, name, email)
values (47, ' person_47', ' person_47@example.com');
insert into PERSON (person_id, name, email)
values (48, ' person_48', ' person_48@example.com');
insert into PERSON (person_id, name, email)
values (49, ' person_49', ' person_49@example.com');
insert into PERSON (person_id, name, email)
values (50, ' person_50', ' person_50@example.com');
insert into PERSON (person_id, name, email)
values (51, ' person_51', ' person_51@example.com');
insert into PERSON (person_id, name, email)
values (52, ' person_52', ' person_52@example.com');
insert into PERSON (person_id, name, email)
values (53, ' person_53', ' person_53@example.com');
insert into PERSON (person_id, name, email)
values (54, ' person_54', ' person_54@example.com');
insert into PERSON (person_id, name, email)
values (55, ' person_55', ' person_55@example.com');
insert into PERSON (person_id, name, email)
values (56, ' person_56', ' person_56@example.com');
insert into PERSON (person_id, name, email)
values (57, ' person_57', ' person_57@example.com');
insert into PERSON (person_id, name, email)
values (58, ' person_58', ' person_58@example.com');
insert into PERSON (person_id, name, email)
values (59, ' person_59', ' person_59@example.com');
insert into PERSON (person_id, name, email)
values (60, ' person_60', ' person_60@example.com');
insert into PERSON (person_id, name, email)
values (61, ' person_61', ' person_61@example.com');
insert into PERSON (person_id, name, email)
values (62, ' person_62', ' person_62@example.com');
insert into PERSON (person_id, name, email)
values (63, ' person_63', ' person_63@example.com');
insert into PERSON (person_id, name, email)
values (64, ' person_64', ' person_64@example.com');
insert into PERSON (person_id, name, email)
values (65, ' person_65', ' person_65@example.com');
insert into PERSON (person_id, name, email)
values (66, ' person_66', ' person_66@example.com');
insert into PERSON (person_id, name, email)
values (67, ' person_67', ' person_67@example.com');
insert into PERSON (person_id, name, email)
values (68, ' person_68', ' person_68@example.com');
insert into PERSON (person_id, name, email)
values (69, ' person_69', ' person_69@example.com');
commit;
prompt 200 records committed...
insert into PERSON (person_id, name, email)
values (70, ' person_70', ' person_70@example.com');
insert into PERSON (person_id, name, email)
values (71, ' person_71', ' person_71@example.com');
insert into PERSON (person_id, name, email)
values (72, ' person_72', ' person_72@example.com');
insert into PERSON (person_id, name, email)
values (73, ' person_73', ' person_73@example.com');
insert into PERSON (person_id, name, email)
values (74, ' person_74', ' person_74@example.com');
insert into PERSON (person_id, name, email)
values (75, ' person_75', ' person_75@example.com');
insert into PERSON (person_id, name, email)
values (76, ' person_76', ' person_76@example.com');
insert into PERSON (person_id, name, email)
values (77, ' person_77', ' person_77@example.com');
insert into PERSON (person_id, name, email)
values (78, ' person_78', ' person_78@example.com');
insert into PERSON (person_id, name, email)
values (79, ' person_79', ' person_79@example.com');
insert into PERSON (person_id, name, email)
values (80, ' person_80', ' person_80@example.com');
insert into PERSON (person_id, name, email)
values (81, ' person_81', ' person_81@example.com');
insert into PERSON (person_id, name, email)
values (82, ' person_82', ' person_82@example.com');
insert into PERSON (person_id, name, email)
values (83, ' person_83', ' person_83@example.com');
insert into PERSON (person_id, name, email)
values (84, ' person_84', ' person_84@example.com');
insert into PERSON (person_id, name, email)
values (85, ' person_85', ' person_85@example.com');
insert into PERSON (person_id, name, email)
values (86, ' person_86', ' person_86@example.com');
insert into PERSON (person_id, name, email)
values (87, ' person_87', ' person_87@example.com');
insert into PERSON (person_id, name, email)
values (88, ' person_88', ' person_88@example.com');
insert into PERSON (person_id, name, email)
values (89, ' person_89', ' person_89@example.com');
insert into PERSON (person_id, name, email)
values (90, ' person_90', ' person_90@example.com');
insert into PERSON (person_id, name, email)
values (91, ' person_91', ' person_91@example.com');
insert into PERSON (person_id, name, email)
values (92, ' person_92', ' person_92@example.com');
insert into PERSON (person_id, name, email)
values (93, ' person_93', ' person_93@example.com');
insert into PERSON (person_id, name, email)
values (94, ' person_94', ' person_94@example.com');
insert into PERSON (person_id, name, email)
values (95, ' person_95', ' person_95@example.com');
insert into PERSON (person_id, name, email)
values (96, ' person_96', ' person_96@example.com');
insert into PERSON (person_id, name, email)
values (97, ' person_97', ' person_97@example.com');
insert into PERSON (person_id, name, email)
values (98, ' person_98', ' person_98@example.com');
insert into PERSON (person_id, name, email)
values (99, ' person_99', ' person_99@example.com');
insert into PERSON (person_id, name, email)
values (100, ' person_100', ' person_100@example.com');
insert into PERSON (person_id, name, email)
values (101, ' person_101', ' person_101@example.com');
insert into PERSON (person_id, name, email)
values (102, ' person_102', ' person_102@example.com');
insert into PERSON (person_id, name, email)
values (103, ' person_103', ' person_103@example.com');
insert into PERSON (person_id, name, email)
values (104, ' person_104', ' person_104@example.com');
insert into PERSON (person_id, name, email)
values (105, ' person_105', ' person_105@example.com');
insert into PERSON (person_id, name, email)
values (106, ' person_106', ' person_106@example.com');
insert into PERSON (person_id, name, email)
values (107, ' person_107', ' person_107@example.com');
insert into PERSON (person_id, name, email)
values (108, ' person_108', ' person_108@example.com');
insert into PERSON (person_id, name, email)
values (109, ' person_109', ' person_109@example.com');
insert into PERSON (person_id, name, email)
values (110, ' person_110', ' person_110@example.com');
insert into PERSON (person_id, name, email)
values (111, ' person_111', ' person_111@example.com');
insert into PERSON (person_id, name, email)
values (112, ' person_112', ' person_112@example.com');
insert into PERSON (person_id, name, email)
values (113, ' person_113', ' person_113@example.com');
insert into PERSON (person_id, name, email)
values (114, ' person_114', ' person_114@example.com');
insert into PERSON (person_id, name, email)
values (115, ' person_115', ' person_115@example.com');
insert into PERSON (person_id, name, email)
values (116, ' person_116', ' person_116@example.com');
insert into PERSON (person_id, name, email)
values (117, ' person_117', ' person_117@example.com');
insert into PERSON (person_id, name, email)
values (118, ' person_118', ' person_118@example.com');
insert into PERSON (person_id, name, email)
values (119, ' person_119', ' person_119@example.com');
insert into PERSON (person_id, name, email)
values (120, ' person_120', ' person_120@example.com');
insert into PERSON (person_id, name, email)
values (121, ' person_121', ' person_121@example.com');
insert into PERSON (person_id, name, email)
values (122, ' person_122', ' person_122@example.com');
insert into PERSON (person_id, name, email)
values (124, ' person_124', ' person_124@example.com');
insert into PERSON (person_id, name, email)
values (125, ' person_125', ' person_125@example.com');
insert into PERSON (person_id, name, email)
values (126, ' person_126', ' person_126@example.com');
insert into PERSON (person_id, name, email)
values (127, ' person_127', ' person_127@example.com');
insert into PERSON (person_id, name, email)
values (128, ' person_128', ' person_128@example.com');
insert into PERSON (person_id, name, email)
values (129, ' person_129', ' person_129@example.com');
insert into PERSON (person_id, name, email)
values (130, ' person_130', ' person_130@example.com');
insert into PERSON (person_id, name, email)
values (131, ' person_131', ' person_131@example.com');
insert into PERSON (person_id, name, email)
values (132, ' person_132', ' person_132@example.com');
insert into PERSON (person_id, name, email)
values (133, ' person_133', ' person_133@example.com');
insert into PERSON (person_id, name, email)
values (134, ' person_134', ' person_134@example.com');
insert into PERSON (person_id, name, email)
values (135, ' person_135', ' person_135@example.com');
insert into PERSON (person_id, name, email)
values (136, ' person_136', ' person_136@example.com');
insert into PERSON (person_id, name, email)
values (137, ' person_137', ' person_137@example.com');
insert into PERSON (person_id, name, email)
values (138, ' person_138', ' person_138@example.com');
insert into PERSON (person_id, name, email)
values (139, ' person_139', ' person_139@example.com');
insert into PERSON (person_id, name, email)
values (140, ' person_140', ' person_140@example.com');
insert into PERSON (person_id, name, email)
values (141, ' person_141', ' person_141@example.com');
insert into PERSON (person_id, name, email)
values (142, ' person_142', ' person_142@example.com');
insert into PERSON (person_id, name, email)
values (143, ' person_143', ' person_143@example.com');
insert into PERSON (person_id, name, email)
values (144, ' person_144', ' person_144@example.com');
insert into PERSON (person_id, name, email)
values (145, ' person_145', ' person_145@example.com');
insert into PERSON (person_id, name, email)
values (146, ' person_146', ' person_146@example.com');
insert into PERSON (person_id, name, email)
values (147, ' person_147', ' person_147@example.com');
insert into PERSON (person_id, name, email)
values (148, ' person_148', ' person_148@example.com');
insert into PERSON (person_id, name, email)
values (149, ' person_149', ' person_149@example.com');
insert into PERSON (person_id, name, email)
values (150, ' person_150', ' person_150@example.com');
insert into PERSON (person_id, name, email)
values (151, ' person_151', ' person_151@example.com');
insert into PERSON (person_id, name, email)
values (152, ' person_152', ' person_152@example.com');
insert into PERSON (person_id, name, email)
values (153, ' person_153', ' person_153@example.com');
insert into PERSON (person_id, name, email)
values (154, ' person_154', ' person_154@example.com');
insert into PERSON (person_id, name, email)
values (155, ' person_155', ' person_155@example.com');
insert into PERSON (person_id, name, email)
values (156, ' person_156', ' person_156@example.com');
insert into PERSON (person_id, name, email)
values (157, ' person_157', ' person_157@example.com');
insert into PERSON (person_id, name, email)
values (158, ' person_158', ' person_158@example.com');
insert into PERSON (person_id, name, email)
values (159, ' person_159', ' person_159@example.com');
insert into PERSON (person_id, name, email)
values (160, ' person_160', ' person_160@example.com');
insert into PERSON (person_id, name, email)
values (161, ' person_161', ' person_161@example.com');
insert into PERSON (person_id, name, email)
values (162, ' person_162', ' person_162@example.com');
insert into PERSON (person_id, name, email)
values (163, ' person_163', ' person_163@example.com');
insert into PERSON (person_id, name, email)
values (164, ' person_164', ' person_164@example.com');
insert into PERSON (person_id, name, email)
values (165, ' person_165', ' person_165@example.com');
insert into PERSON (person_id, name, email)
values (166, ' person_166', ' person_166@example.com');
insert into PERSON (person_id, name, email)
values (167, ' person_167', ' person_167@example.com');
insert into PERSON (person_id, name, email)
values (168, ' person_168', ' person_168@example.com');
insert into PERSON (person_id, name, email)
values (169, ' person_169', ' person_169@example.com');
insert into PERSON (person_id, name, email)
values (170, ' person_170', ' person_170@example.com');
commit;
prompt 300 records committed...
insert into PERSON (person_id, name, email)
values (171, ' person_171', ' person_171@example.com');
insert into PERSON (person_id, name, email)
values (172, ' person_172', ' person_172@example.com');
insert into PERSON (person_id, name, email)
values (173, ' person_173', ' person_173@example.com');
insert into PERSON (person_id, name, email)
values (174, ' person_174', ' person_174@example.com');
insert into PERSON (person_id, name, email)
values (175, ' person_175', ' person_175@example.com');
insert into PERSON (person_id, name, email)
values (176, ' person_176', ' person_176@example.com');
insert into PERSON (person_id, name, email)
values (177, ' person_177', ' person_177@example.com');
insert into PERSON (person_id, name, email)
values (178, ' person_178', ' person_178@example.com');
insert into PERSON (person_id, name, email)
values (179, ' person_179', ' person_179@example.com');
insert into PERSON (person_id, name, email)
values (180, ' person_180', ' person_180@example.com');
insert into PERSON (person_id, name, email)
values (181, ' person_181', ' person_181@example.com');
insert into PERSON (person_id, name, email)
values (182, ' person_182', ' person_182@example.com');
insert into PERSON (person_id, name, email)
values (183, ' person_183', ' person_183@example.com');
insert into PERSON (person_id, name, email)
values (184, ' person_184', ' person_184@example.com');
insert into PERSON (person_id, name, email)
values (185, ' person_185', ' person_185@example.com');
insert into PERSON (person_id, name, email)
values (186, ' person_186', ' person_186@example.com');
insert into PERSON (person_id, name, email)
values (187, ' person_187', ' person_187@example.com');
insert into PERSON (person_id, name, email)
values (188, ' person_188', ' person_188@example.com');
insert into PERSON (person_id, name, email)
values (189, ' person_189', ' person_189@example.com');
insert into PERSON (person_id, name, email)
values (190, ' person_190', ' person_190@example.com');
insert into PERSON (person_id, name, email)
values (191, ' person_191', ' person_191@example.com');
insert into PERSON (person_id, name, email)
values (192, ' person_192', ' person_192@example.com');
insert into PERSON (person_id, name, email)
values (193, ' person_193', ' person_193@example.com');
insert into PERSON (person_id, name, email)
values (194, ' person_194', ' person_194@example.com');
insert into PERSON (person_id, name, email)
values (195, ' person_195', ' person_195@example.com');
insert into PERSON (person_id, name, email)
values (196, ' person_196', ' person_196@example.com');
insert into PERSON (person_id, name, email)
values (197, ' person_197', ' person_197@example.com');
insert into PERSON (person_id, name, email)
values (198, ' person_198', ' person_198@example.com');
insert into PERSON (person_id, name, email)
values (199, ' person_199', ' person_199@example.com');
insert into PERSON (person_id, name, email)
values (200, ' person_200', ' person_200@example.com');
insert into PERSON (person_id, name, email)
values (201, ' person_201', ' person_201@example.com');
insert into PERSON (person_id, name, email)
values (202, ' person_202', ' person_202@example.com');
insert into PERSON (person_id, name, email)
values (203, ' person_203', ' person_203@example.com');
insert into PERSON (person_id, name, email)
values (204, ' person_204', ' person_204@example.com');
insert into PERSON (person_id, name, email)
values (205, ' person_205', ' person_205@example.com');
insert into PERSON (person_id, name, email)
values (206, ' person_206', ' person_206@example.com');
insert into PERSON (person_id, name, email)
values (207, ' person_207', ' person_207@example.com');
insert into PERSON (person_id, name, email)
values (208, ' person_208', ' person_208@example.com');
insert into PERSON (person_id, name, email)
values (209, ' person_209', ' person_209@example.com');
insert into PERSON (person_id, name, email)
values (210, ' person_210', ' person_210@example.com');
insert into PERSON (person_id, name, email)
values (211, ' person_211', ' person_211@example.com');
insert into PERSON (person_id, name, email)
values (212, ' person_212', ' person_212@example.com');
insert into PERSON (person_id, name, email)
values (213, ' person_213', ' person_213@example.com');
insert into PERSON (person_id, name, email)
values (214, ' person_214', ' person_214@example.com');
insert into PERSON (person_id, name, email)
values (215, ' person_215', ' person_215@example.com');
insert into PERSON (person_id, name, email)
values (216, ' person_216', ' person_216@example.com');
insert into PERSON (person_id, name, email)
values (217, ' person_217', ' person_217@example.com');
insert into PERSON (person_id, name, email)
values (218, ' person_218', ' person_218@example.com');
insert into PERSON (person_id, name, email)
values (219, ' person_219', ' person_219@example.com');
insert into PERSON (person_id, name, email)
values (220, ' person_220', ' person_220@example.com');
insert into PERSON (person_id, name, email)
values (221, ' person_221', ' person_221@example.com');
insert into PERSON (person_id, name, email)
values (222, ' person_222', ' person_222@example.com');
insert into PERSON (person_id, name, email)
values (223, ' person_223', ' person_223@example.com');
insert into PERSON (person_id, name, email)
values (224, ' person_224', ' person_224@example.com');
insert into PERSON (person_id, name, email)
values (225, ' person_225', ' person_225@example.com');
insert into PERSON (person_id, name, email)
values (226, ' person_226', ' person_226@example.com');
insert into PERSON (person_id, name, email)
values (227, ' person_227', ' person_227@example.com');
insert into PERSON (person_id, name, email)
values (228, ' person_228', ' person_228@example.com');
insert into PERSON (person_id, name, email)
values (229, ' person_229', ' person_229@example.com');
insert into PERSON (person_id, name, email)
values (230, ' person_230', ' person_230@example.com');
insert into PERSON (person_id, name, email)
values (231, ' person_231', ' person_231@example.com');
insert into PERSON (person_id, name, email)
values (232, ' person_232', ' person_232@example.com');
insert into PERSON (person_id, name, email)
values (233, ' person_233', ' person_233@example.com');
insert into PERSON (person_id, name, email)
values (234, ' person_234', ' person_234@example.com');
insert into PERSON (person_id, name, email)
values (235, ' person_235', ' person_235@example.com');
insert into PERSON (person_id, name, email)
values (236, ' person_236', ' person_236@example.com');
insert into PERSON (person_id, name, email)
values (237, ' person_237', ' person_237@example.com');
insert into PERSON (person_id, name, email)
values (238, ' person_238', ' person_238@example.com');
insert into PERSON (person_id, name, email)
values (239, ' person_239', ' person_239@example.com');
insert into PERSON (person_id, name, email)
values (240, ' person_240', ' person_240@example.com');
insert into PERSON (person_id, name, email)
values (241, ' person_241', ' person_241@example.com');
insert into PERSON (person_id, name, email)
values (242, ' person_242', ' person_242@example.com');
insert into PERSON (person_id, name, email)
values (243, ' person_243', ' person_243@example.com');
insert into PERSON (person_id, name, email)
values (244, ' person_244', ' person_244@example.com');
insert into PERSON (person_id, name, email)
values (245, ' person_245', ' person_245@example.com');
insert into PERSON (person_id, name, email)
values (246, ' person_246', ' person_246@example.com');
insert into PERSON (person_id, name, email)
values (247, ' person_247', ' person_247@example.com');
insert into PERSON (person_id, name, email)
values (248, ' person_248', ' person_248@example.com');
insert into PERSON (person_id, name, email)
values (249, ' person_249', ' person_249@example.com');
insert into PERSON (person_id, name, email)
values (250, ' person_250', ' person_250@example.com');
insert into PERSON (person_id, name, email)
values (251, ' person_251', ' person_251@example.com');
insert into PERSON (person_id, name, email)
values (252, ' person_252', ' person_252@example.com');
insert into PERSON (person_id, name, email)
values (253, ' person_253', ' person_253@example.com');
insert into PERSON (person_id, name, email)
values (254, ' person_254', ' person_254@example.com');
insert into PERSON (person_id, name, email)
values (255, ' person_255', ' person_255@example.com');
insert into PERSON (person_id, name, email)
values (256, ' person_256', ' person_256@example.com');
insert into PERSON (person_id, name, email)
values (257, ' person_257', ' person_257@example.com');
insert into PERSON (person_id, name, email)
values (258, ' person_258', ' person_258@example.com');
insert into PERSON (person_id, name, email)
values (259, ' person_259', ' person_259@example.com');
insert into PERSON (person_id, name, email)
values (260, ' person_260', ' person_260@example.com');
insert into PERSON (person_id, name, email)
values (261, ' person_261', ' person_261@example.com');
insert into PERSON (person_id, name, email)
values (262, ' person_262', ' person_262@example.com');
insert into PERSON (person_id, name, email)
values (263, ' person_263', ' person_263@example.com');
insert into PERSON (person_id, name, email)
values (264, ' person_264', ' person_264@example.com');
insert into PERSON (person_id, name, email)
values (265, ' person_265', ' person_265@example.com');
insert into PERSON (person_id, name, email)
values (266, ' person_266', ' person_266@example.com');
insert into PERSON (person_id, name, email)
values (267, ' person_267', ' person_267@example.com');
insert into PERSON (person_id, name, email)
values (268, ' person_268', ' person_268@example.com');
insert into PERSON (person_id, name, email)
values (269, ' person_269', ' person_269@example.com');
insert into PERSON (person_id, name, email)
values (270, ' person_270', ' person_270@example.com');
commit;
prompt 400 records committed...
insert into PERSON (person_id, name, email)
values (271, ' person_271', ' person_271@example.com');
insert into PERSON (person_id, name, email)
values (272, ' person_272', ' person_272@example.com');
insert into PERSON (person_id, name, email)
values (273, ' person_273', ' person_273@example.com');
insert into PERSON (person_id, name, email)
values (274, ' person_274', ' person_274@example.com');
insert into PERSON (person_id, name, email)
values (275, ' person_275', ' person_275@example.com');
insert into PERSON (person_id, name, email)
values (276, ' person_276', ' person_276@example.com');
insert into PERSON (person_id, name, email)
values (277, ' person_277', ' person_277@example.com');
insert into PERSON (person_id, name, email)
values (278, ' person_278', ' person_278@example.com');
insert into PERSON (person_id, name, email)
values (279, ' person_279', ' person_279@example.com');
insert into PERSON (person_id, name, email)
values (280, ' person_280', ' person_280@example.com');
insert into PERSON (person_id, name, email)
values (281, ' person_281', ' person_281@example.com');
insert into PERSON (person_id, name, email)
values (282, ' person_282', ' person_282@example.com');
insert into PERSON (person_id, name, email)
values (283, ' person_283', ' person_283@example.com');
insert into PERSON (person_id, name, email)
values (284, ' person_284', ' person_284@example.com');
insert into PERSON (person_id, name, email)
values (285, ' person_285', ' person_285@example.com');
insert into PERSON (person_id, name, email)
values (286, ' person_286', ' person_286@example.com');
insert into PERSON (person_id, name, email)
values (287, ' person_287', ' person_287@example.com');
insert into PERSON (person_id, name, email)
values (288, ' person_288', ' person_288@example.com');
insert into PERSON (person_id, name, email)
values (289, ' person_289', ' person_289@example.com');
insert into PERSON (person_id, name, email)
values (290, ' person_290', ' person_290@example.com');
insert into PERSON (person_id, name, email)
values (291, ' person_291', ' person_291@example.com');
insert into PERSON (person_id, name, email)
values (292, ' person_292', ' person_292@example.com');
insert into PERSON (person_id, name, email)
values (293, ' person_293', ' person_293@example.com');
insert into PERSON (person_id, name, email)
values (294, ' person_294', ' person_294@example.com');
insert into PERSON (person_id, name, email)
values (295, ' person_295', ' person_295@example.com');
insert into PERSON (person_id, name, email)
values (296, ' person_296', ' person_296@example.com');
insert into PERSON (person_id, name, email)
values (297, ' person_297', ' person_297@example.com');
insert into PERSON (person_id, name, email)
values (298, ' person_298', ' person_298@example.com');
insert into PERSON (person_id, name, email)
values (299, ' person_299', ' person_299@example.com');
insert into PERSON (person_id, name, email)
values (300, ' person_300', ' person_300@example.com');
insert into PERSON (person_id, name, email)
values (301, ' person_301', ' person_301@example.com');
insert into PERSON (person_id, name, email)
values (302, ' person_302', ' person_302@example.com');
insert into PERSON (person_id, name, email)
values (303, ' person_303', ' person_303@example.com');
insert into PERSON (person_id, name, email)
values (304, ' person_304', ' person_304@example.com');
insert into PERSON (person_id, name, email)
values (305, ' person_305', ' person_305@example.com');
insert into PERSON (person_id, name, email)
values (306, ' person_306', ' person_306@example.com');
insert into PERSON (person_id, name, email)
values (307, ' person_307', ' person_307@example.com');
insert into PERSON (person_id, name, email)
values (308, ' person_308', ' person_308@example.com');
insert into PERSON (person_id, name, email)
values (309, ' person_309', ' person_309@example.com');
insert into PERSON (person_id, name, email)
values (310, ' person_310', ' person_310@example.com');
insert into PERSON (person_id, name, email)
values (311, ' person_311', ' person_311@example.com');
insert into PERSON (person_id, name, email)
values (312, ' person_312', ' person_312@example.com');
insert into PERSON (person_id, name, email)
values (313, ' person_313', ' person_313@example.com');
insert into PERSON (person_id, name, email)
values (314, ' person_314', ' person_314@example.com');
insert into PERSON (person_id, name, email)
values (315, ' person_315', ' person_315@example.com');
insert into PERSON (person_id, name, email)
values (316, ' person_316', ' person_316@example.com');
insert into PERSON (person_id, name, email)
values (317, ' person_317', ' person_317@example.com');
insert into PERSON (person_id, name, email)
values (318, ' person_318', ' person_318@example.com');
insert into PERSON (person_id, name, email)
values (319, ' person_319', ' person_319@example.com');
insert into PERSON (person_id, name, email)
values (320, ' person_320', ' person_320@example.com');
insert into PERSON (person_id, name, email)
values (321, ' person_321', ' person_321@example.com');
insert into PERSON (person_id, name, email)
values (322, ' person_322', ' person_322@example.com');
insert into PERSON (person_id, name, email)
values (323, ' person_323', ' person_323@example.com');
insert into PERSON (person_id, name, email)
values (324, ' person_324', ' person_324@example.com');
insert into PERSON (person_id, name, email)
values (325, ' person_325', ' person_325@example.com');
insert into PERSON (person_id, name, email)
values (326, ' person_326', ' person_326@example.com');
insert into PERSON (person_id, name, email)
values (327, ' person_327', ' person_327@example.com');
insert into PERSON (person_id, name, email)
values (328, ' person_328', ' person_328@example.com');
insert into PERSON (person_id, name, email)
values (329, ' person_329', ' person_329@example.com');
insert into PERSON (person_id, name, email)
values (330, ' person_330', ' person_330@example.com');
insert into PERSON (person_id, name, email)
values (331, ' person_331', ' person_331@example.com');
insert into PERSON (person_id, name, email)
values (332, ' person_332', ' person_332@example.com');
insert into PERSON (person_id, name, email)
values (333, ' person_333', ' person_333@example.com');
insert into PERSON (person_id, name, email)
values (334, ' person_334', ' person_334@example.com');
insert into PERSON (person_id, name, email)
values (335, ' person_335', ' person_335@example.com');
insert into PERSON (person_id, name, email)
values (336, ' person_336', ' person_336@example.com');
insert into PERSON (person_id, name, email)
values (337, ' person_337', ' person_337@example.com');
insert into PERSON (person_id, name, email)
values (338, ' person_338', ' person_338@example.com');
insert into PERSON (person_id, name, email)
values (339, ' person_339', ' person_339@example.com');
insert into PERSON (person_id, name, email)
values (340, ' person_340', ' person_340@example.com');
insert into PERSON (person_id, name, email)
values (341, ' person_341', ' person_341@example.com');
insert into PERSON (person_id, name, email)
values (342, ' person_342', ' person_342@example.com');
insert into PERSON (person_id, name, email)
values (343, ' person_343', ' person_343@example.com');
insert into PERSON (person_id, name, email)
values (344, ' person_344', ' person_344@example.com');
insert into PERSON (person_id, name, email)
values (345, ' person_345', ' person_345@example.com');
insert into PERSON (person_id, name, email)
values (346, ' person_346', ' person_346@example.com');
insert into PERSON (person_id, name, email)
values (347, ' person_347', ' person_347@example.com');
insert into PERSON (person_id, name, email)
values (348, ' person_348', ' person_348@example.com');
insert into PERSON (person_id, name, email)
values (349, ' person_349', ' person_349@example.com');
insert into PERSON (person_id, name, email)
values (350, ' person_350', ' person_350@example.com');
insert into PERSON (person_id, name, email)
values (351, ' person_351', ' person_351@example.com');
insert into PERSON (person_id, name, email)
values (352, ' person_352', ' person_352@example.com');
insert into PERSON (person_id, name, email)
values (353, ' person_353', ' person_353@example.com');
insert into PERSON (person_id, name, email)
values (354, ' person_354', ' person_354@example.com');
insert into PERSON (person_id, name, email)
values (355, ' person_355', ' person_355@example.com');
insert into PERSON (person_id, name, email)
values (356, ' person_356', ' person_356@example.com');
insert into PERSON (person_id, name, email)
values (357, ' person_357', ' person_357@example.com');
insert into PERSON (person_id, name, email)
values (358, ' person_358', ' person_358@example.com');
insert into PERSON (person_id, name, email)
values (359, ' person_359', ' person_359@example.com');
insert into PERSON (person_id, name, email)
values (360, ' person_360', ' person_360@example.com');
insert into PERSON (person_id, name, email)
values (361, ' person_361', ' person_361@example.com');
insert into PERSON (person_id, name, email)
values (362, ' person_362', ' person_362@example.com');
insert into PERSON (person_id, name, email)
values (363, ' person_363', ' person_363@example.com');
insert into PERSON (person_id, name, email)
values (364, ' person_364', ' person_364@example.com');
insert into PERSON (person_id, name, email)
values (365, ' person_365', ' person_365@example.com');
insert into PERSON (person_id, name, email)
values (366, ' person_366', ' person_366@example.com');
insert into PERSON (person_id, name, email)
values (367, ' person_367', ' person_367@example.com');
insert into PERSON (person_id, name, email)
values (368, ' person_368', ' person_368@example.com');
insert into PERSON (person_id, name, email)
values (369, ' person_369', ' person_369@example.com');
insert into PERSON (person_id, name, email)
values (370, ' person_370', ' person_370@example.com');
commit;
prompt 500 records committed...
insert into PERSON (person_id, name, email)
values (371, ' person_371', ' person_371@example.com');
insert into PERSON (person_id, name, email)
values (372, ' person_372', ' person_372@example.com');
insert into PERSON (person_id, name, email)
values (373, ' person_373', ' person_373@example.com');
insert into PERSON (person_id, name, email)
values (374, ' person_374', ' person_374@example.com');
insert into PERSON (person_id, name, email)
values (375, ' person_375', ' person_375@example.com');
insert into PERSON (person_id, name, email)
values (376, ' person_376', ' person_376@example.com');
insert into PERSON (person_id, name, email)
values (377, ' person_377', ' person_377@example.com');
insert into PERSON (person_id, name, email)
values (378, ' person_378', ' person_378@example.com');
insert into PERSON (person_id, name, email)
values (379, ' person_379', ' person_379@example.com');
insert into PERSON (person_id, name, email)
values (380, ' person_380', ' person_380@example.com');
insert into PERSON (person_id, name, email)
values (381, ' person_381', ' person_381@example.com');
insert into PERSON (person_id, name, email)
values (382, ' person_382', ' person_382@example.com');
insert into PERSON (person_id, name, email)
values (383, ' person_383', ' person_383@example.com');
insert into PERSON (person_id, name, email)
values (384, ' person_384', ' person_384@example.com');
insert into PERSON (person_id, name, email)
values (385, ' person_385', ' person_385@example.com');
insert into PERSON (person_id, name, email)
values (386, ' person_386', ' person_386@example.com');
insert into PERSON (person_id, name, email)
values (387, ' person_387', ' person_387@example.com');
insert into PERSON (person_id, name, email)
values (388, ' person_388', ' person_388@example.com');
insert into PERSON (person_id, name, email)
values (389, ' person_389', ' person_389@example.com');
insert into PERSON (person_id, name, email)
values (390, ' person_390', ' person_390@example.com');
insert into PERSON (person_id, name, email)
values (391, ' person_391', ' person_391@example.com');
insert into PERSON (person_id, name, email)
values (392, ' person_392', ' person_392@example.com');
insert into PERSON (person_id, name, email)
values (393, ' person_393', ' person_393@example.com');
insert into PERSON (person_id, name, email)
values (394, ' person_394', ' person_394@example.com');
insert into PERSON (person_id, name, email)
values (395, ' person_395', ' person_395@example.com');
insert into PERSON (person_id, name, email)
values (396, ' person_396', ' person_396@example.com');
insert into PERSON (person_id, name, email)
values (397, ' person_397', ' person_397@example.com');
insert into PERSON (person_id, name, email)
values (398, ' person_398', ' person_398@example.com');
insert into PERSON (person_id, name, email)
values (399, ' person_399', ' person_399@example.com');
insert into PERSON (person_id, name, email)
values (400, ' person_400', ' person_400@example.com');
insert into PERSON (person_id, name, email)
values (8974947, 'Rita', 'rassante@qssgroup.ch');
insert into PERSON (person_id, name, email)
values (91847899, 'Natalie', 'nataliec@seiaarons.nl');
insert into PERSON (person_id, name, email)
values (52178873, 'Frankie', 'frankieb@aop.uk');
insert into PERSON (person_id, name, email)
values (21067309, 'Dar', 'd.willis@fordmotor.com');
insert into PERSON (person_id, name, email)
values (91438343, 'Chazz', 'chaggard@netnumina.com');
insert into PERSON (person_id, name, email)
values (107704804, 'Neil', 'nduschel@aco.de');
insert into PERSON (person_id, name, email)
values (31238390, 'Percy', 'percy@esteelauder.de');
insert into PERSON (person_id, name, email)
values (39568082, 'Rita', 'rita.d@smartronix.com');
insert into PERSON (person_id, name, email)
values (33692839, 'Shelby', 's.tripplehorn@procurementcentre.com');
insert into PERSON (person_id, name, email)
values (53355558, 'Kim', 'kim.orbit@usgovernment.at');
insert into PERSON (person_id, name, email)
values (102312860, 'Rachel', 'rachel.vanshelton@servicesource.ca');
insert into PERSON (person_id, name, email)
values (5915689, 'Merrilee', 'merrilee.berkeley@virbac.com');
insert into PERSON (person_id, name, email)
values (14372091, 'Demi', 'demi.andrews@americanvanguard.com');
insert into PERSON (person_id, name, email)
values (97602600, 'Selma', 'selma.wiest@travizon.com');
insert into PERSON (person_id, name, email)
values (110344706, 'Jay', 'jay.p@escalade.com');
insert into PERSON (person_id, name, email)
values (79430173, 'Chely', 'chely.hutton@travizon.com');
insert into PERSON (person_id, name, email)
values (16020078, 'Joely', 'joely.field@vitacostcom.com');
insert into PERSON (person_id, name, email)
values (85802450, 'Ozzy', 'ozzy.carrington@saralee.ch');
insert into PERSON (person_id, name, email)
values (107863831, 'Clarence', 'clarence.s@adolph.uk');
insert into PERSON (person_id, name, email)
values (46431977, 'Sam', 'samm@arkidata.ca');
insert into PERSON (person_id, name, email)
values (25459083, 'Winona', 'w.furay@outsourcegroup.com');
insert into PERSON (person_id, name, email)
values (94808131, 'Merillee', 'merilleep@apexsystems.dk');
insert into PERSON (person_id, name, email)
values (65654075, 'Sharon', 's.soul@diageo.com');
insert into PERSON (person_id, name, email)
values (2863403, 'Bryan', 'bryan@sweetproductions.jp');
insert into PERSON (person_id, name, email)
values (36843963, 'Wade', 'w.damon@lindin.com');
insert into PERSON (person_id, name, email)
values (61000967, 'Guy', 'guy.r@codykramerimports.de');
insert into PERSON (person_id, name, email)
values (90908594, 'Donal', 'donal.m@americanexpress.ca');
insert into PERSON (person_id, name, email)
values (17526971, 'Jimmie', 'jimmie.wells@denaliventures.com');
insert into PERSON (person_id, name, email)
values (49439138, 'Wayne', 'wayne.duvall@knightsbridge.jp');
insert into PERSON (person_id, name, email)
values (102157433, 'Tamala', 'tamala.snider@inspirationsoftware.ch');
insert into PERSON (person_id, name, email)
values (63301530, 'Jarvis', 'jarvis.f@consultants.com');
insert into PERSON (person_id, name, email)
values (6272268, 'Renee', 'renee.alston@eastmankodak.com');
insert into PERSON (person_id, name, email)
values (21619139, 'Joy', 'joy.l@bis.uk');
insert into PERSON (person_id, name, email)
values (1621511, 'Miguel', 'miguel@unitedasset.com');
insert into PERSON (person_id, name, email)
values (47597266, 'Lila', 'lastin@labradanutrition.com');
insert into PERSON (person_id, name, email)
values (41355626, 'Johnnie', 'johnnieg@northhighland.com');
insert into PERSON (person_id, name, email)
values (34928623, 'Rowan', 'rowan.s@sps.com');
insert into PERSON (person_id, name, email)
values (94696053, 'Randall', 'rchestnut@trainersoft.jp');
insert into PERSON (person_id, name, email)
values (99082177, 'Rascal', 'rascal.cross@fam.com');
insert into PERSON (person_id, name, email)
values (31492240, 'Sinead', 's.miller@news.ca');
insert into PERSON (person_id, name, email)
values (74647193, 'Tal', 'tal@httprint.com');
insert into PERSON (person_id, name, email)
values (3345462, 'Emma', 'emma.watson@csi.com');
insert into PERSON (person_id, name, email)
values (109381365, 'Lauren', 'lauren.whitley@dell.com');
insert into PERSON (person_id, name, email)
values (32632986, 'Jessica', 'jessica.ohara@slt.pt');
insert into PERSON (person_id, name, email)
values (44544934, 'Uma', 'uma.steagall@nhr.com');
insert into PERSON (person_id, name, email)
values (57922811, 'Jet', 'jet@hondamotor.com');
insert into PERSON (person_id, name, email)
values (33124597, 'Freddie', 'freddie.rooker@greene.ec');
insert into PERSON (person_id, name, email)
values (59637394, 'Vendetta', 'vendetta.jeter@fpf.li');
insert into PERSON (person_id, name, email)
values (75023431, 'Mary Beth', 'marybetho@ssci.com');
insert into PERSON (person_id, name, email)
values (43334797, 'Sammy', 'sammy.price@qls.com');
insert into PERSON (person_id, name, email)
values (102834183, 'Julio', 'julio.daylewis@diversitech.com');
insert into PERSON (person_id, name, email)
values (59697571, 'Ellen', 'ellen.oneal@gapinc.uk');
insert into PERSON (person_id, name, email)
values (75317061, 'Cliff', 'cliff.sweet@kmart.com');
insert into PERSON (person_id, name, email)
values (60134914, 'Steve', 'steveh@nike.fr');
insert into PERSON (person_id, name, email)
values (46620732, 'Dylan', 'dylan.geldof@printcafesoftware.de');
insert into PERSON (person_id, name, email)
values (84093095, 'Mac', 'mac.vinton@trafficmanagement.es');
insert into PERSON (person_id, name, email)
values (18656057, 'Leelee', 'leelee.colton@bayer.fr');
insert into PERSON (person_id, name, email)
values (95992851, 'Ike', 'ike@webgroup.ca');
insert into PERSON (person_id, name, email)
values (69647139, 'Joey', 'j.howard@eastmankodak.za');
insert into PERSON (person_id, name, email)
values (95791371, 'Madeline', 'madeline.shatner@shufflemaster.com');
insert into PERSON (person_id, name, email)
values (825601, 'Nicole', 'n.liu@ntas.de');
insert into PERSON (person_id, name, email)
values (60566528, 'Karen', 'karen.gracie@progressivemedical.com');
insert into PERSON (person_id, name, email)
values (10431627, 'Kevn', 'kevn.whitman@meghasystems.lk');
insert into PERSON (person_id, name, email)
values (34311465, 'Hookah', 'hookah.neill@outsourcegroup.it');
insert into PERSON (person_id, name, email)
values (36279887, 'Andy', 'andy@mathis.uk');
insert into PERSON (person_id, name, email)
values (45165766, 'Harold', 'harold.ammons@hiltonhotels.com');
insert into PERSON (person_id, name, email)
values (22291203, 'Praga', 'praga.aykroyd@gagwear.nl');
insert into PERSON (person_id, name, email)
values (56320074, 'Carlene', 'c.england@technica.fr');
insert into PERSON (person_id, name, email)
values (101769891, 'Tal', 'tal@mls.com');
insert into PERSON (person_id, name, email)
values (79283717, 'Bret', 'bret.dalley@esoftsolutions.uk');
commit;
prompt 600 records committed...
insert into PERSON (person_id, name, email)
values (48819473, 'Patty', 'patty@authoria.ht');
insert into PERSON (person_id, name, email)
values (50975690, 'Aidan', 'a.dicaprio@ungertechnologies.ch');
insert into PERSON (person_id, name, email)
values (5997283, 'Wally', 'wally.lovitz@airmethods.nl');
insert into PERSON (person_id, name, email)
values (78800248, 'Kate', 'kate.norton@tmaresources.com');
insert into PERSON (person_id, name, email)
values (28344170, 'Eugene', 'eugene.s@jma.il');
insert into PERSON (person_id, name, email)
values (37132688, 'Denzel', 'd.winwood@pscinfogroup.dk');
insert into PERSON (person_id, name, email)
values (20089877, 'Madeline', 'madeline.cash@shot.com');
insert into PERSON (person_id, name, email)
values (92382257, 'Armin', 'a.pigottsmith@tracertechnologies.com');
insert into PERSON (person_id, name, email)
values (71014171, 'Jody', 'jody.lillard@scooterstore.com');
insert into PERSON (person_id, name, email)
values (6277583, 'Pablo', 'pablo.s@aop.com');
insert into PERSON (person_id, name, email)
values (5201215, 'Rosie', 'r.franklin@alohanysystems.com');
insert into PERSON (person_id, name, email)
values (93021051, 'Carrie', 'carrie.barry@air.com');
insert into PERSON (person_id, name, email)
values (31182101, 'Nikka', 'nikka.root@meritagetechnologies.uk');
insert into PERSON (person_id, name, email)
values (93643528, 'Michelle', 'mdevine@mag.hu');
insert into PERSON (person_id, name, email)
values (78216125, 'Rutger', 'rutger.rawls@simplycertificates.br');
insert into PERSON (person_id, name, email)
values (2888281, 'Lydia', 'lydia@microsoft.is');
insert into PERSON (person_id, name, email)
values (102764268, 'Rowan', 'rowan.g@prahs.br');
insert into PERSON (person_id, name, email)
values (66631874, 'Julianne', 'juliannes@viacell.it');
insert into PERSON (person_id, name, email)
values (48766462, 'Jaime', 'jaime.lovitz@lms.ec');
insert into PERSON (person_id, name, email)
values (35561020, 'Lee', 'lee.goodall@mcdonalds.com');
insert into PERSON (person_id, name, email)
values (36665327, 'Ernest', 'ernestc@fsffinancial.com');
insert into PERSON (person_id, name, email)
values (18151678, 'Kevn', 'kevn.piven@ultimus.com');
insert into PERSON (person_id, name, email)
values (22762172, 'Temuera', 'temuera.keaton@parker.fr');
insert into PERSON (person_id, name, email)
values (86919233, 'Lili', 'lili.mraz@mms.com');
insert into PERSON (person_id, name, email)
values (11734142, 'Ruth', 'r.grier@accuship.th');
insert into PERSON (person_id, name, email)
values (77020735, 'Shawn', 'shawn.biel@ccfholding.com');
insert into PERSON (person_id, name, email)
values (76744554, 'Wendy', 'w.chinlund@networkdisplay.com');
insert into PERSON (person_id, name, email)
values (109511035, 'Adam', 'adam.rudd@kingland.ca');
insert into PERSON (person_id, name, email)
values (59967752, 'Vern', 'vern.pitney@accurateautobody.com');
insert into PERSON (person_id, name, email)
values (9312095, 'Chely', 'chely.e@newmedia.com');
insert into PERSON (person_id, name, email)
values (50093683, 'Radney', 'radney.alda@oneidafinancial.com');
insert into PERSON (person_id, name, email)
values (77632376, 'Sheena', 'sheena.finn@magnet.ca');
insert into PERSON (person_id, name, email)
values (99653447, 'Andre', 'andre.stormare@diamondgroup.no');
insert into PERSON (person_id, name, email)
values (51304856, 'Rachid', 'rmeniketti@meritagetechnologies.dk');
insert into PERSON (person_id, name, email)
values (83578306, 'Chet', 'chet.m@pscinfogroup.com');
insert into PERSON (person_id, name, email)
values (11243881, 'Embeth', 'embeth@seiaarons.il');
insert into PERSON (person_id, name, email)
values (92626982, 'Jeffrey', 'jeffrey.t@nobrainerblindscom.jp');
insert into PERSON (person_id, name, email)
values (38638582, 'Jared', 'jared.goodall@americanland.com');
insert into PERSON (person_id, name, email)
values (20558435, 'Balthazar', 'badams@stmaryland.de');
insert into PERSON (person_id, name, email)
values (8286078, 'Todd', 'todds@activeservices.de');
insert into PERSON (person_id, name, email)
values (18708913, 'Lance', 'lance@generalmills.de');
insert into PERSON (person_id, name, email)
values (81108907, 'Lara', 'lara.gandolfini@securitycheck.ch');
insert into PERSON (person_id, name, email)
values (64438764, 'Meredith', 'm.thurman@elite.com');
insert into PERSON (person_id, name, email)
values (49241799, 'Stockard', 'stockard.vicious@cmi.de');
insert into PERSON (person_id, name, email)
values (81567205, 'Sheryl', 'skrieger@safeway.uk');
insert into PERSON (person_id, name, email)
values (18896708, 'Aida', 'aida.ferry@supplycorecom.com');
insert into PERSON (person_id, name, email)
values (20985472, 'Samantha', 'samantha.torn@healthscribe.jp');
insert into PERSON (person_id, name, email)
values (34291608, 'Donal', 'donal.horton@campbellsoup.com');
insert into PERSON (person_id, name, email)
values (54309429, 'Harrison', 'harrison.sarandon@whitewave.uk');
insert into PERSON (person_id, name, email)
values (85293360, 'Peter', 'pallen@capitalautomotive.uk');
insert into PERSON (person_id, name, email)
values (20729588, 'Miki', 'miki.jolie@aventis.com');
insert into PERSON (person_id, name, email)
values (87606695, 'Vin', 'v.rubinek@usphysicaltherapy.uk');
insert into PERSON (person_id, name, email)
values (97159156, 'Neve', 'neve.bonham@solutionbuilders.uk');
insert into PERSON (person_id, name, email)
values (28624490, 'Ashley', 'avaughan@sps.com');
insert into PERSON (person_id, name, email)
values (51692532, 'Gina', 'gina.paige@allstar.de');
insert into PERSON (person_id, name, email)
values (70311349, 'Heath', 'heathh@caliber.com');
insert into PERSON (person_id, name, email)
values (56124570, 'Art', 'art.wells@hitechpharmacal.com');
insert into PERSON (person_id, name, email)
values (100187924, 'Howie', 'howie.holden@cyberthink.it');
insert into PERSON (person_id, name, email)
values (54774366, 'Shannyn', 'shannyn.m@3tsystems.de');
insert into PERSON (person_id, name, email)
values (61841550, 'Machine', 'm.aiken@officedepot.de');
insert into PERSON (person_id, name, email)
values (105567659, 'Maxine', 'maxineg@progressivedesigns.com');
insert into PERSON (person_id, name, email)
values (44802114, 'Kieran', 'kieran.dempsey@diageo.za');
insert into PERSON (person_id, name, email)
values (64028115, 'Moe', 'moe.dillon@extremepizza.de');
insert into PERSON (person_id, name, email)
values (69759877, 'Michelle', 'm.beck@medamicus.de');
insert into PERSON (person_id, name, email)
values (60312612, 'Larnelle', 'larnellee@wellsfinancial.it');
insert into PERSON (person_id, name, email)
values (28352195, 'Eric', 'eric.bandy@3tsystems.com');
insert into PERSON (person_id, name, email)
values (27387089, 'Lynette', 'lfishburne@unitedasset.com');
insert into PERSON (person_id, name, email)
values (48660252, 'Stellan', 'stellan@tmt.com');
insert into PERSON (person_id, name, email)
values (15406795, 'Clint', 'clint.h@oss.it');
insert into PERSON (person_id, name, email)
values (72158080, 'Judi', 'jhingle@electricalsolutions.nz');
insert into PERSON (person_id, name, email)
values (14425952, 'Pam', 'pperlman@gdi.dk');
insert into PERSON (person_id, name, email)
values (2055293, 'Lynn', 'lynn@shot.com');
insert into PERSON (person_id, name, email)
values (18545633, 'Terrence', 'terrence.melvin@signalperfection.com');
insert into PERSON (person_id, name, email)
values (56420045, 'Kathleen', 'kbright@naturescure.de');
insert into PERSON (person_id, name, email)
values (95989835, 'Treat', 'treat.diddley@maverick.jp');
insert into PERSON (person_id, name, email)
values (74660112, 'Benjamin', 'b.li@pearllawgroup.ch');
insert into PERSON (person_id, name, email)
values (84266889, 'Mykelti', 'mykelti@cws.ar');
insert into PERSON (person_id, name, email)
values (85694252, 'Juliette', 'j.hirsch@glmt.com');
insert into PERSON (person_id, name, email)
values (25919076, 'William', 'w.raitt@trm.com');
insert into PERSON (person_id, name, email)
values (76813375, 'Ike', 'ike.busey@ufs.com');
insert into PERSON (person_id, name, email)
values (73498557, 'Jesse', 'j.sweeney@hcoa.uk');
insert into PERSON (person_id, name, email)
values (108049587, 'Marisa', 'mmurray@oneidafinancial.com');
insert into PERSON (person_id, name, email)
values (12972765, 'Ellen', 'eflemyng@tlsservicebureau.il');
insert into PERSON (person_id, name, email)
values (84286345, 'Fred', 'fred.sisto@ceom.it');
insert into PERSON (person_id, name, email)
values (57046466, 'Busta', 'busta.detmer@veritekinternational.com');
insert into PERSON (person_id, name, email)
values (64423770, 'Rik', 'rikc@tracertechnologies.de');
insert into PERSON (person_id, name, email)
values (68296059, 'France', 'france.richards@data.com');
insert into PERSON (person_id, name, email)
values (26248908, 'Chet', 'csawa@tilsonlandscape.au');
insert into PERSON (person_id, name, email)
values (55037228, 'Tamala', 'tamala.cockburn@fiberlink.br');
insert into PERSON (person_id, name, email)
values (99117539, 'Christopher', 'christopher.hawthorne@base.com');
insert into PERSON (person_id, name, email)
values (5450206, 'Joshua', 'jnicholson@ositissoftware.jp');
insert into PERSON (person_id, name, email)
values (98005733, 'Roscoe', 'roscoe.marie@tarragonrealty.com');
insert into PERSON (person_id, name, email)
values (51100197, 'Miguel', 'miguel.ramirez@priorityexpress.com');
insert into PERSON (person_id, name, email)
values (103707214, 'Timothy', 'timothy.oszajca@typhoon.be');
insert into PERSON (person_id, name, email)
values (45332262, 'Rueben', 'rueben.vanian@apexsystems.id');
insert into PERSON (person_id, name, email)
values (8859631, 'Samuel', 'samuel.winstone@adeasolutions.au');
insert into PERSON (person_id, name, email)
values (47446579, 'Bruce', 'bruce.sandler@mindworks.ca');
insert into PERSON (person_id, name, email)
values (96069843, 'Meryl', 'm.janssen@dancor.jp');
insert into PERSON (person_id, name, email)
values (30060438, 'Betty', 'bettym@denaliventures.com');
insert into PERSON (person_id, name, email)
values (99702492, 'Kitty', 'kittys@wav.com');
commit;
prompt 700 records committed...
insert into PERSON (person_id, name, email)
values (54771872, 'Joe', 'joe.oneal@onstaff.de');
insert into PERSON (person_id, name, email)
values (34175329, 'Loretta', 'lmacdowell@fmi.br');
insert into PERSON (person_id, name, email)
values (46137020, 'Kurtwood', 'kurtwood.lane@hfn.com');
insert into PERSON (person_id, name, email)
values (62440967, 'Alice', 'alice.lynch@pioneerdatasystems.com');
insert into PERSON (person_id, name, email)
values (62598604, 'Gord', 'gord@mindworks.de');
insert into PERSON (person_id, name, email)
values (70475528, 'Ralph', 'ralph.short@curagroup.de');
insert into PERSON (person_id, name, email)
values (19693536, 'Sandra', 's.malkovich@smi.br');
insert into PERSON (person_id, name, email)
values (16753146, 'Shawn', 'shawn@trc.com');
insert into PERSON (person_id, name, email)
values (105918555, 'Dylan', 'dylan.c@adolph.com');
insert into PERSON (person_id, name, email)
values (81186109, 'Robin', 'robin.quinones@ivorysystems.ch');
insert into PERSON (person_id, name, email)
values (61805867, 'Donna', 'donna.dickinson@ccb.pl');
insert into PERSON (person_id, name, email)
values (92777254, 'Franz', 'franzt@printtech.com');
insert into PERSON (person_id, name, email)
values (19719721, 'Sydney', 'sydney@timberlanewoodcrafters.com');
insert into PERSON (person_id, name, email)
values (40550720, 'Rip', 'rip.delancie@sms.uk');
insert into PERSON (person_id, name, email)
values (18990818, 'Nelly', 'nelly.salt@sandyspringbancorp.de');
insert into PERSON (person_id, name, email)
values (85345850, 'Swoosie', 'swoosie@simplycertificates.com');
insert into PERSON (person_id, name, email)
values (48700160, 'Rufus', 'r.stevens@medsource.com');
insert into PERSON (person_id, name, email)
values (85953052, 'Christopher', 'christopher.cox@unica.de');
insert into PERSON (person_id, name, email)
values (110380537, 'Allison', 'allison.t@jewettcameron.de');
insert into PERSON (person_id, name, email)
values (77074933, 'Joe', 'joe.james@max.de');
insert into PERSON (person_id, name, email)
values (32802595, 'Delroy', 'delroy.hiatt@mosaic.ht');
insert into PERSON (person_id, name, email)
values (75814863, 'Leelee', 'leelee.tomei@appriss.sg');
insert into PERSON (person_id, name, email)
values (51110313, 'Domingo', 'd.baker@topicsentertainment.tr');
insert into PERSON (person_id, name, email)
values (2268923, 'Liv', 'liv.tankard@swp.de');
insert into PERSON (person_id, name, email)
values (3583103, 'Night', 'n.tomlin@daimlerchrysler.uk');
insert into PERSON (person_id, name, email)
values (32864781, 'Dwight', 'dwight@caliber.gr');
insert into PERSON (person_id, name, email)
values (88532795, 'Vanessa', 'vanessa@pepsico.de');
insert into PERSON (person_id, name, email)
values (17584679, 'Nik', 'nik.withers@msdw.th');
insert into PERSON (person_id, name, email)
values (61420991, 'Alec', 'alec.parish@nobrainerblindscom.com');
insert into PERSON (person_id, name, email)
values (97836237, 'Lee', 'lpotter@nobrainerblindscom.com');
insert into PERSON (person_id, name, email)
values (59117399, 'Veruca', 'verucam@granitesystems.de');
insert into PERSON (person_id, name, email)
values (110132675, 'Ceili', 'ceili.spears@biosite.com');
insert into PERSON (person_id, name, email)
values (17740467, 'Al', 'al.s@mse.com');
insert into PERSON (person_id, name, email)
values (26029065, 'Sona', 'sona@mwp.at');
insert into PERSON (person_id, name, email)
values (9657691, 'Isabella', 'isabellaf@circuitcitystores.mx');
insert into PERSON (person_id, name, email)
values (97732419, 'Vonda', 'vonda.garfunkel@dynacqinternational.ca');
insert into PERSON (person_id, name, email)
values (25375476, 'Jay', 'jay@monarchcasino.it');
insert into PERSON (person_id, name, email)
values (99925794, 'Michelle', 'mhaysbert@pepsico.com');
insert into PERSON (person_id, name, email)
values (3979158, 'Emerson', 'emerson.davidson@abatix.no');
insert into PERSON (person_id, name, email)
values (24364998, 'Kurt', 'kurt.franklin@wyeth.com');
insert into PERSON (person_id, name, email)
values (74234921, 'Amy', 'amy.england@nmr.pt');
insert into PERSON (person_id, name, email)
values (71368560, 'Kyra', 'kyrav@unilever.ca');
insert into PERSON (person_id, name, email)
values (53264433, 'Wayman', 'wayman.w@hitechpharmacal.com');
insert into PERSON (person_id, name, email)
values (24440013, 'Debra', 'debra.wincott@gillani.ca');
insert into PERSON (person_id, name, email)
values (44785662, 'Saul', 'saul@multimedialive.at');
insert into PERSON (person_id, name, email)
values (90068214, 'Liam', 'liam.t@sears.com');
insert into PERSON (person_id, name, email)
values (97770526, 'Dionne', 'dionne.heron@kingston.com');
insert into PERSON (person_id, name, email)
values (104510121, 'Joey', 'joey.cox@tilia.com');
insert into PERSON (person_id, name, email)
values (63281909, 'Cherry', 'cojeda@learningvoyage.it');
insert into PERSON (person_id, name, email)
values (109411961, 'Bret', 'bret.skarsgard@keith.com');
insert into PERSON (person_id, name, email)
values (62177950, 'Dennis', 'dennis@aoltimewarner.com');
insert into PERSON (person_id, name, email)
values (4667816, 'Ving', 'ving@techrx.uk');
insert into PERSON (person_id, name, email)
values (91191557, 'Praga', 'praga.love@smartronix.com');
insert into PERSON (person_id, name, email)
values (79003152, 'Beth', 'beth.sheen@americanland.de');
insert into PERSON (person_id, name, email)
values (69131964, 'Stevie', 'stevie.pacino@air.ca');
insert into PERSON (person_id, name, email)
values (80093413, 'Alessandro', 'a.furay@teamstudio.ee');
insert into PERSON (person_id, name, email)
values (15498273, 'Sally', 'sally.burrows@qestrel.it');
insert into PERSON (person_id, name, email)
values (39057470, 'Darren', 'darren.scott@ecopy.de');
insert into PERSON (person_id, name, email)
values (65693663, 'Edward', 'e.laurie@americanvanguard.com');
insert into PERSON (person_id, name, email)
values (66031303, 'Jean-Luc', 'j.hayes@interfacesoftware.com');
insert into PERSON (person_id, name, email)
values (72068875, 'Molly', 'molly.shand@abs.ch');
insert into PERSON (person_id, name, email)
values (62362280, 'Roscoe', 'roscoe.p@sfb.py');
insert into PERSON (person_id, name, email)
values (66675058, 'Loren', 'loren.tankard@nhhc.jp');
insert into PERSON (person_id, name, email)
values (107017973, 'Sophie', 'sophie.chaykin@techbooks.mx');
insert into PERSON (person_id, name, email)
values (27568773, 'Franz', 'f.dalton@sfmai.pl');
insert into PERSON (person_id, name, email)
values (3266789, 'Balthazar', 'balthazar.barrymore@tmt.ch');
insert into PERSON (person_id, name, email)
values (48642988, 'Lizzy', 'lizzy.s@bigdoughcom.it');
insert into PERSON (person_id, name, email)
values (44126064, 'Miles', 'miles.wells@creditorsinterchange.com');
insert into PERSON (person_id, name, email)
values (31204662, 'Ellen', 'ellen.maxwell@oss.de');
insert into PERSON (person_id, name, email)
values (45119093, 'Brian', 'brian.cheadle@capstone.com');
insert into PERSON (person_id, name, email)
values (36239895, 'Rhett', 'rnelson@horizon.com');
insert into PERSON (person_id, name, email)
values (103330529, 'Lou', 'lou@nha.com');
insert into PERSON (person_id, name, email)
values (44034262, 'Gilberto', 'gilberto.damon@smi.fr');
insert into PERSON (person_id, name, email)
values (29889990, 'Tim', 'tim.mcdowell@quicksilverresources.de');
insert into PERSON (person_id, name, email)
values (89533876, 'Mark', 'markc@ositissoftware.de');
insert into PERSON (person_id, name, email)
values (106090017, 'Taye', 'tayec@smi.uk');
insert into PERSON (person_id, name, email)
values (86287524, 'Pat', 'pmeyer@tilia.ca');
insert into PERSON (person_id, name, email)
values (103938408, 'Rhys', 'rdamon@amerisourcefunding.de');
insert into PERSON (person_id, name, email)
values (67394466, 'Bradley', 'bradley.almond@heritagemicrofilm.uk');
insert into PERSON (person_id, name, email)
values (89828480, 'Peter', 'peter.prinze@navigatorsystems.com');
insert into PERSON (person_id, name, email)
values (41547918, 'Suzy', 'suzy.crystal@exinomtechnologies.com');
insert into PERSON (person_id, name, email)
values (65785637, 'Rose', 'rose.collins@esoftsolutions.com');
insert into PERSON (person_id, name, email)
values (69473678, 'Joanna', 'joanna@vfs.ca');
insert into PERSON (person_id, name, email)
values (90905392, 'Famke', 'famke.ness@topicsentertainment.com');
insert into PERSON (person_id, name, email)
values (72897835, 'Heath', 'hsutherland@perfectorder.uk');
insert into PERSON (person_id, name, email)
values (76325421, 'Jeff', 'jeff.playboys@mss.com');
insert into PERSON (person_id, name, email)
values (65503901, 'Larry', 'larry.mccain@enterprise.at');
insert into PERSON (person_id, name, email)
values (63311199, 'Gerald', 'g.secada@authoria.com');
insert into PERSON (person_id, name, email)
values (61922929, 'Lili', 'lili.ryder@yes.com');
insert into PERSON (person_id, name, email)
values (75148, 'Daniel', 'daniel.shelton@meridiangold.com');
insert into PERSON (person_id, name, email)
values (7168787, 'Wallace', 'wallace.tilly@aristotle.dk');
insert into PERSON (person_id, name, email)
values (22548772, 'Lorraine', 'lorraine.elizabeth@mastercardinternational.py');
insert into PERSON (person_id, name, email)
values (16437921, 'Connie', 'connie.h@gci.ch');
insert into PERSON (person_id, name, email)
values (102039282, 'Hope', 'hope.shawn@yes.at');
insert into PERSON (person_id, name, email)
values (16839245, 'Trini', 'trini@merck.pt');
insert into PERSON (person_id, name, email)
values (91450492, 'Dabney', 'dtwilley@emt.be');
insert into PERSON (person_id, name, email)
values (100978644, 'Dom', 'dom.wiedlin@gra.no');
insert into PERSON (person_id, name, email)
values (91840727, 'Jill', 'j.benoit@taycorfinancial.de');
insert into PERSON (person_id, name, email)
values (102144322, 'Radney', 'radney.barry@cowlitzbancorp.jp');
insert into PERSON (person_id, name, email)
values (29997138, 'Mel', 'mel.apple@cima.de');
commit;
prompt 800 records loaded
prompt Loading COMMUNITY_COMPANY...
insert into COMMUNITY_COMPANY (person_id)
values (1);
insert into COMMUNITY_COMPANY (person_id)
values (2);
insert into COMMUNITY_COMPANY (person_id)
values (3);
insert into COMMUNITY_COMPANY (person_id)
values (4);
insert into COMMUNITY_COMPANY (person_id)
values (5);
commit;
prompt 5 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (type, product_number)
values ('food', 1001);
insert into PRODUCT (type, product_number)
values ('clothing', 1002);
insert into PRODUCT (type, product_number)
values ('electronics', 1003);
insert into PRODUCT (type, product_number)
values ('books', 1004);
insert into PRODUCT (type, product_number)
values ('toys', 1005);
commit;
prompt 5 records loaded
prompt Loading COMMUNITY_COMPANY_PRODUCT...
prompt Table is empty
prompt Loading DONOR...
insert into DONOR (person_id)
values (1);
insert into DONOR (person_id)
values (2);
insert into DONOR (person_id)
values (3);
insert into DONOR (person_id)
values (4);
insert into DONOR (person_id)
values (5);
commit;
prompt 5 records loaded
prompt Loading CONTRIBUTION...
prompt Table is empty
prompt Loading FINANCIAL_CONTRIBUTION...
prompt Table is empty
prompt Loading PRODUCT_DONATION...
prompt Table is empty
prompt Loading PRODUCT_DONATION_DETAILS...
prompt Table is empty
prompt Enabling foreign key constraints for COMMUNITY_COMPANY...
alter table COMMUNITY_COMPANY enable constraint SYS_C00721698;
prompt Enabling foreign key constraints for COMMUNITY_COMPANY_PRODUCT...
alter table COMMUNITY_COMPANY_PRODUCT enable constraint SYS_C00721707;
alter table COMMUNITY_COMPANY_PRODUCT enable constraint SYS_C00721708;
prompt Enabling foreign key constraints for DONOR...
alter table DONOR enable constraint SYS_C00721695;
prompt Enabling foreign key constraints for CONTRIBUTION...
alter table CONTRIBUTION enable constraint SYS_C00721713;
prompt Enabling foreign key constraints for FINANCIAL_CONTRIBUTION...
alter table FINANCIAL_CONTRIBUTION enable constraint SYS_C00721718;
prompt Enabling foreign key constraints for PRODUCT_DONATION...
alter table PRODUCT_DONATION enable constraint SYS_C00721721;
prompt Enabling foreign key constraints for PRODUCT_DONATION_DETAILS...
alter table PRODUCT_DONATION_DETAILS enable constraint SYS_C00721726;
alter table PRODUCT_DONATION_DETAILS enable constraint SYS_C00721727;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for COMMUNITY_COMPANY...
alter table COMMUNITY_COMPANY enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for COMMUNITY_COMPANY_PRODUCT...
alter table COMMUNITY_COMPANY_PRODUCT enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for CONTRIBUTION...
alter table CONTRIBUTION enable all triggers;
prompt Enabling triggers for FINANCIAL_CONTRIBUTION...
alter table FINANCIAL_CONTRIBUTION enable all triggers;
prompt Enabling triggers for PRODUCT_DONATION...
alter table PRODUCT_DONATION enable all triggers;
prompt Enabling triggers for PRODUCT_DONATION_DETAILS...
alter table PRODUCT_DONATION_DETAILS enable all triggers;
