BEGIN;


CREATE TABLE IF NOT EXISTS fsweb.doctor
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    name character varying,
    surname character varying,
    proficiency character varying,
    PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS fsweb.nurse
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    name character varying,
    surname character varying,
    proficiency character varying,
    PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS fsweb.patient
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    name character varying,
    surname character varying,
    email character varying,
    complaint text,
    PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS fsweb.surgery
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    nurse_id bigint NOT NULL,
    doctor_id bigint NOT NULL,
    patient_id bigint NOT NULL,
    PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS fsweb.operation
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    patient_id bigint NOT NULL,
    doctor_id bigint,
    PRIMARY KEY (id)
    );

ALTER TABLE IF EXISTS fsweb.surgery
    ADD FOREIGN KEY (nurse_id)
    REFERENCES fsweb.nurse (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS fsweb.surgery
    ADD FOREIGN KEY (doctor_id)
    REFERENCES fsweb.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS fsweb.surgery
    ADD FOREIGN KEY (patient_id)
    REFERENCES fsweb.patient (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS fsweb.operation
    ADD FOREIGN KEY (patient_id)
    REFERENCES fsweb.patient (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS fsweb.operation
    ADD FOREIGN KEY (doctor_id)
    REFERENCES fsweb.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS fsweb.operation
    ADD FOREIGN KEY (doctor_id)
    REFERENCES fsweb.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;

END;