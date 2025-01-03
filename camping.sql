CREATE TABLE IF NOT EXISTS "KATASKHNWTHS" (
	"kwd_katask" integer,
	"fname" varchar,
	"lname" varchar,
	"email" varchar,
	"id_number" varchar,
	"thlefwno" varchar,
	PRIMARY KEY ("kwd_katask")
);

CREATE TABLE IF NOT EXISTS "KRATHSH" (
	"kwd_krathshs" varchar,
	"hmer_afixhs" date,
	"hmer_anaxwrhshs" date,
	"hmer_krathshs" date,
	"kwd_katask" integer,
	"arithmos_paidiwn" integer,
	"arithmos_enhlikwn" integer,
	PRIMARY KEY ("kwd_krathshs"),
	FOREIGN KEY ("kwd_katask") REFERENCES "KATASKHNWTHS" ("kwd_katask")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "KATALYMA" (
	"kwd_katal" varchar,
	PRIMARY KEY ("kwd_katal")
);

CREATE TABLE IF NOT EXISTS "KRAT_PERILAMB_KATALYM" (
	"kwd_krathshs" varchar,
	"kwd_katal" varchar,
	PRIMARY KEY ("kwd_krathshs", "kwd_katal"),
	FOREIGN KEY ("kwd_krathshs") REFERENCES "KRATHSH" ("kwd_krathshs")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT,
	FOREIGN KEY ("kwd_katal") REFERENCES "KATALYMA" ("kwd_katal")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "DWMATIO" (
	"kwd_katal" varchar,
	"xwrhtikothta " integer,
	"kostos " integer,
	PRIMARY KEY ("kwd_katal"),
	FOREIGN KEY ("kwd_katal") REFERENCES "KATALYMA" ("kwd_katal")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "RV" (
	"kwd_katal" varchar,
	"xwrhtikothta " integer,
	"kostos " integer,
	PRIMARY KEY ("kwd_katal"),
	FOREIGN KEY ("kwd_katal") REFERENCES "KATALYMA" ("kwd_katal")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "XWROS_KATASKHNWSHS" (
	"kwd_katal" varchar,
	"xwrhtikothta " integer,
	"kostos " integer,
	PRIMARY KEY ("kwd_katal"),
	FOREIGN KEY ("kwd_katal") REFERENCES "KATALYMA" ("kwd_katal")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "PLHRWMH" (
	"kwd_plhrwmhs" varchar,
	"kwd_katask" integer,
	"kwd_krathshs" varchar,
	PRIMARY KEY ("kwd_plhrwmhs"),
	FOREIGN KEY ("kwd_katask") REFERENCES "KATASKHNWTHS" ("kwd_katask")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT,
	FOREIGN KEY ("kwd_krathshs") REFERENCES "KRATHSH" ("kwd_krathshs")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "AXIOLOGHSH" (
	"vathmologia" integer,
	"sxolia" text,
	"kwd_katask" integer,
	"kwd_krathshs" varchar,
	FOREIGN KEY ("kwd_katask") REFERENCES "KATASKHNWTHS" ("kwd_katask")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT,
	FOREIGN KEY ("kwd_krathshs") REFERENCES "KRATHSH" ("kwd_krathshs")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS "YPHRESIA" (
	"kwd_yphresias" varchar,
	"typos" varchar,
	"kostos" integer,
	PRIMARY KEY ("kwd_yphresias")
);

CREATE TABLE IF NOT EXISTS "KRAT_EPILE_YPHR" (
	"kwd_krathshs" varchar,
	"kwd_yphresias" varchar,
	PRIMARY KEY ("kwd_krathshs", "kwd_yphresias"),
	FOREIGN KEY ("kwd_krathshs") REFERENCES "KRATHSH" ("kwd_krathshs")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT,
	FOREIGN KEY ("kwd_yphresias") REFERENCES "YPHRESIA" ("kwd_yphresias")
            ON UPDATE RESTRICT
            ON DELETE RESTRICT
);

