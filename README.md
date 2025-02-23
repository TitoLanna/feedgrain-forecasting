# Commodity Database Schema

## Overview
This document describes the relational database schema for managing commodity groups, commodities, geographical locations, attributes, and transactions. The schema ensures data integrity using foreign key constraints.

## Database Schema

### Tables

#### `commodity_groups`
This table stores commodity group details.
```sql
CREATE TABLE commodity_groups (
    Group_ID INT PRIMARY KEY,
    Group_Desc VARCHAR(255)
);
```

#### `commodities`
This table stores commodity information, linking each commodity to a group.
```sql
CREATE TABLE commodities (
    Commodity_ID INT PRIMARY KEY,
    Commodity_Desc VARCHAR(255),
    Group_ID INT,
    GroupCommod_ID FLOAT,
    GroupCommod_Desc VARCHAR(255),
    FOREIGN KEY (Group_ID) REFERENCES commodity_groups(Group_ID)
);
```

#### `geography`
This table stores geographical locations.
```sql
CREATE TABLE geography (
    Geography_ID INT PRIMARY KEY,
    GeographyIndented_Desc VARCHAR(255)
);
```

#### `attributes`
This table stores various attributes and associated units.
```sql
CREATE TABLE attributes (
    Attribute_ID INT PRIMARY KEY,
    Attribute_Desc VARCHAR(255),
    Unit_ID INT,
    Unit_Desc VARCHAR(255)
);
```

#### `transactions`
This table records transactions linking commodities, attributes, geographical locations, and time-based data.
```sql
CREATE TABLE transactions (
    Transaction_ID SERIAL PRIMARY KEY,
    Commodity_ID INT,
    Attribute_ID INT,
    Geography_ID INT,
    Year_ID INT,
    Frequency_ID INT,
    Frequency_Desc VARCHAR(255),
    Timeperiod_ID INT,
    Timeperiod_Desc VARCHAR(255),
    Amount FLOAT,
    FOREIGN KEY (Commodity_ID) REFERENCES commodities(Commodity_ID),
    FOREIGN KEY (Attribute_ID) REFERENCES attributes(Attribute_ID),
    FOREIGN KEY Geography_ID) REFERENCES geography(Geography_ID)
);
```

## Entity-Relationship Diagram
Below is a textual representation of the relationships between the tables:

![Entity_Relationship_Diagram](data/raw/ERDiagram.drawio.png)

## Notes
- **Primary Keys (PK):** Ensure unique identification of each row.
- **Foreign Keys (FK):** Establish relationships between tables for data integrity.
- **Transactions Table:** Links commodities, attributes, geography, and time-based data to store valuable insights.

This schema ensures efficient organization and retrieval of commodity data while maintaining integrity through relational constraints.

