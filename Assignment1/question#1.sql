CREATE TABLE Criminals
(Name_first varchar2(15) UNIQUE NOT NULL,
Name_last varchar2(15) UNIQUE NOT NULL,
Aliases varchar2(15) UNIQUE NOT NULL,
Address varchar2(30) UNIQUE NOT NULL,
Phone number(10) UNIQUE,
Violent_offender_status varchar2(1) CHECK (Violent_offender_status IN ('Y', 'N')),
Probation_status varchar2(1) CHECK (Probation_status IN ('Y', 'N')),
Crime_classification varchar2(10) PRIMARY KEY
);

CREATE TABLE Crimes
(Crime_classification varchar2(10),
Sentence_type varchar2(10),
Date_charged DATE,
Status_appeal_eligibility varchar2(10) CHECK (Status_appeal_eligibility IN ('closed', 'can appeal', 'in appeal')),
Hearing_date DATE,
Appeal_cutoff_date DATE,
Arresting_officer varchar2(30),
Crime_codes varchar2(10),
Fine_amount number(10, 2),
Court_fee number(10, 2),
Amount_paid number(10, 2),
Payment_due DATE,
Charge_status varchar2(10) CHECK (Charge_status IN ('pending', 'guilty', 'not guilty')),

CONSTRAINT p_id PRIMARY KEY (Sentence_type, Hearing_date, Arresting_officer),
CONSTRAINT f_key FOREIGN KEY (Crime_classification)
REFERENCES Criminals (Crime_classification)
);

CREATE TABLE Sentencing
(Start_date DATE,
End_date DATE,
Violation_number number(10) UNIQUE NOT NULL,
Sentence_type varchar2(10),

CONSTRAINT fs_key FOREIGN KEY (Sentence_type)
REFERENCES Crimes (Sentence_type)
);

CREATE TABLE Appeals
(Filling_date DATE,
Hearing_date DATE,
Status_of_appeal varchar2(10) CHECK (Status_of_appeal IN ('pending', 'approved', 'disapproved')),
Number_of_appeals number(1) CHECK (Number_of_appeals < 3),

CONSTRAINT fa_key FOREIGN KEY (Hearing_date)
REFERENCES Crimes (Hearing_date)
);

CREATE TABLE Police_officers
(Arresting_officer varchar2(30),
Precinct number(5) UNIQUE,
Badge_numbernumber number(10) UNIQUE,
Phone number(10) UNIQUE,
Status varchar2(10) CHECK (Status IN ('active', 'inactive')),

CONSTRAINT fp_key FOREIGN KEY (Arresting_officer)
REFERENCES Crimes (Arresting_officer)
);