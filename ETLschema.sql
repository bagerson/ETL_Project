--DROP TABLE licenses;
--DROP TABLE complaints;
CREATE TABLE licenses (
	--id SERIAL PRIMARY KEY,
	dca_license_number VARCHAR,
	license_expiration_date VARCHAR,
	license_status VARCHAR,
	license_creation_date VARCHAR,
	industry VARCHAR,
	address_building VARCHAR,
	address_street VARCHAR,
	address_zip VARCHAR,
	address_borough VARCHAR,
	borough_code VARCHAR,
	latitude VARCHAR,
	longitude  VARCHAR
);

CREATE TABLE complaints (
	--id SERIAL PRIMARY KEY,
	complaint_fr_date VARCHAR,
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