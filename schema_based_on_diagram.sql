CREATE TABLE patients (
  id                SERIAL PRIMARY KEY,
  name              VARCHAR,
  date_of_birth     DATE
);

CREATE TABLE medical_histories (
  id                SERIAL PRIMARY KEY,
  admitted_at       TIMESTAMP,
  patient_id        INT REFERENCES patients(id),
  status            VARCHAR
);

CREATE TABLE treatments (
  id                SERIAL PRIMARY KEY,
  type              VARCHAR,
  name              VARCHAR
);

CREATE TABLE medical_histories_has_treatments (
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id                SERIAL PRIMARY KEY,
  total_amount      DECIMAL,
  generated_at      TIMESTAMP,
  payed_at          TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id                SERIAL PRIMARY KEY,
  unit_price        DECIMAL,
  quantity          INT,
  total_price       DECIMAL,
  invoice_id        INT REFERENCES invoices(id),
  treatment_id      INT REFERENCES treatments(id)
);