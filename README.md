# ETL Project Report

## Ben Gerson
## Alex Burschtin

Proposal:

This project will design a database which contains data related to crime rates and the issuance of business licenses in New York City.

This project will rely on two datasets drawn from NYC Open Data

Report:

After downloading both CSVs to our local repository, we read the files from our Jupyter Notebook and converted to data frames. Then we moved all excess columns and changed the column names to match what we wanted to name the fields in the database. This was done to enhance the end user experience and clarify some of the field names/data.
After finishing up the manipulation we ran two separate loads into the postgres database using sql alchemy.

## Data Sources

### [NYPD Complaint Data Historic 2006-2017](https://data.cityofnewyork.us/Public-Safety/NYPD-Complaint-Data-Historic/qgea-i56i)


### [Legally Operating Businesses](https://data.cityofnewyork.us/Business/Legally-Operating-Businesses/w7w3-xahh)


The purpose of this project is to build a database which will hold New York City crime statistics and New York City business openings. That way the end user would be able to easily extract and analyze information related to the impact of crime on business development.

We will be extracting the data from CSVs, cleaning and manipulating, and loading to Postgres database.

Suggested data columns are

Crime
* Date of Report
* Offesnse Description
* Police Report Description
* Borough
* Lat
* Long

Business Licenses
* Date of License Creation
* Industry
* Address
* Lat
* Long
* Borough

## Data Transformation

Data for this project transformed primarily by removing columns which are unlikely to be useful in the final production databse.  Pandas .copy() method was straightforward and allowed for the disposal of unwanted data columns.  The dataframe column headers were also renamed to match the SQL schema column headers.

As a team, we decided not to perform aggregate functions on the existing data tables.  The advantage of performing an aggreagete function (for example, groupby) at the transformaiton stage would have been to reduce the size (number of rows) of the data tables.  However, because the production database is to be used to track the change in crime complaints and DCA business licenses, grouping would lead to a loss of resolution.  For example, multiple crime complaints and multiple business licenses may be issued on the same date.  Grouping would give a count, but remove the type of license or crime reported.  Likewise, grouping by type may reduce the resolution of the date.  The decision was made to leave the data table largely intact so that end user queries could be more flexible.

Because the NYPD complaint dataset includes only lat/long and not zip, the columns must be converted by reverse geocoding.  As a design consideration, calling the google geocoding API 6.5m times is time consuming and expensive.  With the code in place, the end user can call the geocode API to derive zip codes on a much smaller scale.

## Production Database

We decided to use a relational database where the complaints table and license table can be joined on the date field.

## Final Tables

As discussed above, our decision was to ultimately leave the data tables as "complaints" and "licenses" for end user flexibility.  However, we did discuss alternative implementations, including using several smaller tables with primary key indexing

Alternative Production Table ERD: 
![alt text](https://github.com/bagerson/ETL_Project/blob/master/ERD%20diagram.png)

However, given that each smaller table still contained the same number of rows, any gains in efficiency were likely offset by having to perform joins on each table.

## Future Updates

Future considerations include exception handling, progress monitoring for loading large CSV files, and data type changes (for instance, dates are currently stored as VARCHAR, could be converted to DATE in the data table when inserted or by the end user).

