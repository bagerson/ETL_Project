--ETL PROJECT
--BEN GERSON
--ALEX BURSTIN

--Table data for NYC Business Licenses
--Table data for NYPD Complaint information

--DROP TABLE licenses

CREATE TABLE licenses (
	id SERIAL PRIMARY KEY,
	dca_license_number INTEGER,
	license_expiration_date DATE,
	license_status VARCHAR,
	license_creation_date DATE,
	industry VARCHAR,
	address_building VARCHAR,
	address_street VARCHAR,
	address_zip INT,
	address_borough VARCHAR,
	borough_code INTEGER,
	latitude VARCHAR,
	longitude  VARCHAR
	
);

CREATE TABLE complaints (
	id SERIAL PRIMARY KEY,
	complaint_fr_date DATE,
	offense_desc VARCHAR,
	law_cat_code VARCHAR,
	boro_name VARCHAR,
	prem_type VARCHAR,
	susp_age VARCHAR, 
	suspe_race VARCHAR,
	susp_sex VARCHAR,
	latitude VARCHAR,
	longitude  VARCHAR

);