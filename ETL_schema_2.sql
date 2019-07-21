CREATE TABLE complaint_type (
    complaint_no VARCHAR PRIMARY KEY NOT NULL,
    law_cat_code VARCHAR   NOT NULL,
    offense_desc VARCHAR   NOT NULL
);

CREATE TABLE complaint_date (
    complaint_no VARCHAR   NOT NULL,
    complaint_fr_date DATE   NOT NULL,
    FOREIGN KEY (complaint_no) REFERENCES complaint_type(complaint_no)
);

CREATE TABLE complaint_location (
    complaint_no VARCHAR   NOT NULL,
    boro_name VARCHAR   NOT NULL,
    latitude VARCHAR   NOT NULL,
    longitude VARCHAR   NOT NULL,
    FOREIGN KEY (complaint_no) REFERENCES complaint_type(complaint_no)

);

CREATE TABLE complaint_desc (
    complaint_no VARCHAR   NOT NULL,
    prem_type VARCHAR   NOT NULL,
    susp_race VARCHAR   NOT NULL,
    susp_sex VARCHAR   NOT NULL,
    susp_age VARCHAR   NOT NULL,
    FOREIGN KEY (complaint_no) REFERENCES complaint_type(complaint_no)
);

CREATE TABLE license_date (
    DCA_license_no VARCHAR   NOT NULL,
    license_expiration_date VARCHAR   NOT NULL,
    license_status VARCHAR   NOT NULL,
    license_creation_date VARCHAR   NOT NULL,
    CONSTRAINT pk_license_date PRIMARY KEY (
        DCA_license_no
     )
);

CREATE TABLE license_location (
    DCA_license_no VARCHAR   NOT NULL,
    address_building VARCHAR   NOT NULL,
    address_street VARCHAR   NOT NULL,
    address_zip VARCHAR   NOT NULL,
    address_borough VARCHAR   NOT NULL,
    borough_code VARCHAR   NOT NULL,
    latitude VARCHAR   NOT NULL,
    longitude VARCHAR   NOT NULL
);

CREATE TABLE license_desc (
    DCA_license_no VARCHAR   NOT NULL,
    industry VARCHAR   NOT NULL
);