CREATE TABLE commodity_groups (
    Group_ID INT PRIMARY KEY,
    Group_Desc VARCHAR(255)
);

CREATE TABLE commodities (
    Commodity_ID INT PRIMARY KEY,
    Commodity_Desc VARCHAR(255),
    Group_ID INT,
    GroupCommodity_Desc VARCHAR(255),
    FOREIGN KEY (Group_ID) REFERENCES commodity_groups(Group_ID)
);

CREATE TABLE geography (
    Geography_ID INT PRIMARY KEY,
    GeographyIndented_Desc VARCHAR(255)
);

CREATE TABLE attributes (
    Attribute_ID INT PRIMARY KEY,
    Attribute_Desc VARCHAR(255),
    Unit_ID INT,
    Unit_Desc VARCHAR(255)
);

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
    FOREIGN KEY (Geography_ID) REFERENCES geography(Geography_ID)
);
