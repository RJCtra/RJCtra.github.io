# Design Document

By Robert Caig

Video overview: [https://youtu.be/Le5mUH1ZNPM](https://youtu.be/Le5mUH1ZNPM)

## Scope

The purpose of my database is to simulate the basic features of a benefit system. It will store information about beneficiaries, the relationships they have and also benefit payments they receive. The intention that this would be a prototype that has fields that can be modified or queried by a front-end application utilised by government social system employees. As such, it is important that client details are accurately documented along with any relationships they may have.

I have also included a VIEW which can be used to view demographic information without divulging identifiable information. This could be provided to either the public or to other 3rd partie government and government affiliated agencies to assist in their understanding of beneficiaries.

### Outside of scope

In a more fleshed out full version relationships with children would also be included, as well as supplement payments, the ability to store documents such as images,pdfs in the database likely as a an additional table with the data added as a BLOB. A record of payments to the client would also be maintained in a more complete version. If payments to client an income tested, in case client is doing some sort of work not considered living wage, then it would be necessary to have some form of income declaration front-end available to clients in addition to that available to government social system employees - if this were the case, it could be beneficial to provide an option for clients to update their other circumstances.

## Functional Requirements

* • Register, update, and remove client records
* • Add, update, and remove client details and relationships
* • Automatically update various tables based on updates to the database
* • Check what benefit a client is currently on and how much they are paid weekly for the benefit
* • Reduce need for front-end user to have to be directly involved in maintenance of records
* • A view is also provided to access information about demographics without releasing identifiable information.

## Entities

The entities which are of primary concern are those of the client's details, their relationships, and their benefit payments:

#### Client Table
Contains the full personal details of the client, their benefit details, and their relationships. The details collected are as follows:

* •	personal details: first_name (INT), middle_name (VARCHAR), and last_name (VARCHAR), sex (VARCHAR), date_of_birth (DATE)
* •	contact details: street_address (VARCHAR), suburb (VARCHAR), city (VARCHAR), post_code (SMALLINT), region (VARCHAR), phone number, email address (VARCHAR)
* •	account details: client number, login (VARCHAR), password (VARCHAR)
* •	benefit details: benefit id (VARCHAR)
* •	relationship: benefit (INT)
* •	Constraints: Primary key on client_number
* •	Indexes: index_client_number on client_number column

#### Benefit Table

The benefit table contains information about each individual benefit:

* •	benefit_id (VARCHAR) : to access benefit details
* •	benefit_name (VARCHAR) : grants the benefit type
* •	payment (SMALLINT): informs of what the weekly benefit payment is for a given benefit
* •	Constraints: Primary key on benefit_id

#### Payments Table

The payments table contains information about what each individual client is paid each week. It automatically updates when a beneficiary is added

* •	client_id (INT) : to assosciate payments with client
* •	benefit_id (VARCHAR) : to assosciate benefit type with client to obtain payment amount
* •	benefit_payment (SMALLINT) : the amount the client is to be paid weekly
* •	Constraints: Foreign keys on client_number and benefit_id
* •	Indexes: Index index_payment_client_number on client_number column

#### Paymentswork Table

This table is used to assist in updating the payments table - this is discussed at more length in the limitations segment

* •	Constraints: Foreign key on client_number column

#### Partner Table

This table is used to assosciate clients with one another when in a relationship. When two client numbers are added, their respective beneficiary fields are updated with the assosciation.

* •	partner_1_id (INT) : The first partner client_number
* •	partner_2_id (INT) : The second partner client_number
* •	Constraints: Foreign keys on partner_1_ID and partner_2_ID

#### Demographic View

This view is used to provide other agencies (government, government affiliated, public) with the ability to query demographic information about beneficiaries. The information is aggregated from the beneficiaries table. The information made available through this view is:

* • sex (VARCHAR)
* • age (INT)
* • city (VARCHAR)
* • post_code (SMALLINT)
* • region (VARCHAR)


### Relationships

![Database Diagram](https://github.com/code50/82493565/blob/main/CS50%20SQL/project/diagram.jpg)

## Optimizations

Indexes have been added to columns which may be regularly queried; the client_number columns in the beneficiary and payments tables.

## Limitations

The limitations of my database are in part due to my understanding of MySQL as that is the database management system I had chosen to run a database locally. I found that there were complications when using triggers as there were times when I wanted to make updates to the same table that I was using a FROM command on, and apparently this is something that MySQL is not able to do. While I understand that a JOIN may have provided a work around, I was unable to find a way to carry the JOIN out in my code that would satisfy what I was attempting to do, therefore I instead made a new table which was updated with the sought after information from Beneficiary and then used that table to obtain the information using a JOIN on the benefit table to obtain the weekly payment amount for each client.

I had been concerned that my code might be updating all rows every time an update is run on the beneficiary table, however having confirmed that it will only run on the rows that have been changed I felt that it was acceptable to continue with this method.
