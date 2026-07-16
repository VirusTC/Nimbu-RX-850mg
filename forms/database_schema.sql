-- ============================================================================
-- SQL DATABASE SCHEMA FOR NIMBU-RX-850MG HOSPITAL DISPENSING ARCHITECTURE
-- Target System: PostgreSQL 15+ / Enterprise EHR Relational Engine
-- Validation Protocol: Strict data-type parsing for plant-based tracking
-- ============================================================================

CREATE SCHEMA IF NOT EXISTS nimbu_rx;

-- 1. Emergency Antidote Routing Data
CREATE TABLE nimbu_rx.emergency_antidote_routing (
    exposure_id VARCHAR(50) PRIMARY KEY,
    route_of_contact VARCHAR(100) NOT NULL,
    immediate_clinical_action TEXT NOT NULL,
    antidote_neutralizer VARCHAR(150) NOT NULL,
    thermodynamic_mechanism TEXT NOT NULL,
    target_monitoring_window VARCHAR(100) NOT NULL
);

-- 2. Batch Analytical Purity Logs
CREATE TABLE nimbu_rx.batch_analytical_purity (
    analyte_id VARCHAR(50) PRIMARY KEY,
    target_compound VARCHAR(100) NOT NULL,
    analytical_method VARCHAR(100) NOT NULL,
    acceptable_limit VARCHAR(100) NOT NULL,
    observed_baseline_metric VARCHAR(100) NOT NULL,
    pass_fail_status VARCHAR(10) CHECK (pass_fail_status IN ('PASS', 'FAIL'))
);

-- 3. Telehealth Adverse Events Tracking
CREATE TABLE nimbu_rx.telehealth_adverse_events (
    event_id VARCHAR(50) PRIMARY KEY,
    symptom_classification VARCHAR(150) NOT NULL,
    adverse_grading_scale VARCHAR(50) NOT NULL,
    clinical_action_trigger TEXT NOT NULL,
    reporting_requirement VARCHAR(150) NOT NULL,
    data_field_validation VARCHAR(100) NOT NULL
);

-- 4. Hospital Ward Allocations
CREATE TABLE nimbu_rx.hospital_ward_allocations (
    ward_id VARCHAR(50) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    dispensing_device VARCHAR(100) NOT NULL,
    default_stock_level INT NOT NULL CHECK (default_stock_level >= 0),
    emergency_restock_threshold INT NOT NULL CHECK (emergency_restock_threshold >= 0),
    primary_clinical_indication TEXT NOT NULL
);

-- 5. Patient Compliance Metrics
CREATE TABLE nimbu_rx.patient_compliance_metrics (
    metric_id VARCHAR(50) PRIMARY KEY,
    data_point_captured VARCHAR(150) NOT NULL,
    input_data_type VARCHAR(50) NOT NULL,
    target_compliance_value VARCHAR(100) NOT NULL,
    patient_alert_trigger VARCHAR(150) NOT NULL,
    clinical_interpretation TEXT NOT NULL
);

-- ============================================================================
-- TRANSLATIONAL SEEDING COMMANDS (TSV DATA IMPORT MAPPING)
-- COPY statements map directly to the corresponding .tsv layouts
-- ============================================================================

-- COPY nimbu_rx.emergency_antidote_routing FROM 'forms/emergency_antidote_routing.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true);
-- COPY nimbu_rx.batch_analytical_purity FROM 'forms/batch_analytical_purity.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true);
-- COPY nimbu_rx.telehealth_adverse_events FROM 'forms/telehealth_adverse_events.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true);
-- COPY nimbu_rx.hospital_ward_allocations FROM 'forms/hospital_ward_allocations.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true);
-- COPY nimbu_rx.patient_compliance_metrics FROM 'forms/patient_compliance_metrics.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true);
