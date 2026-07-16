-- ============================================================================
-- EXTENDED SQL SCHEMA FOR INFANT MONITOR TELEMETRY & HARDWARE ALLOCATIONS
-- Target System: PostgreSQL 15+ / Enterprise EHR Relational Engine
-- ============================================================================

SET search_path TO nimbu_rx;

-- 1. Infant Monitor Hardware Inventory Data
CREATE TABLE nimbu_rx.hardware_telemetry_mapping (
    monitor_id VARCHAR(50) PRIMARY KEY,
    hardware_manufacturer VARCHAR(100) NOT NULL,
    country_of_origin VARCHAR(100) NOT NULL,
    telemetry_frequency_band VARCHAR(50) NOT NULL,
    acoustic_trigger_limit VARCHAR(100) NOT NULL,
    primary_safety_metric_tracked VARCHAR(150) NOT NULL
);

-- 2. Live Telehealth Telemetry Event Streaming Logs
CREATE TABLE nimbu_rx.telemetry_stream_alerts (
    alert_id SERIAL PRIMARY KEY,
    monitor_id VARCHAR(50) REFERENCES nimbu_rx.hardware_telemetry_mapping(monitor_id),
    patient_id VARCHAR(50) NOT NULL,
    ward_id VARCHAR(50) NOT NULL,
    observed_decibel_delta FLOAT NOT NULL,
    alert_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    clinical_resolution_status VARCHAR(50) CHECK (clinical_resolution_status IN ('RESOLVED_SAFE', 'SUSPENDED_THERAPY', 'FALSE_ALARM'))
);

-- 3. Pediatric/Oncology Dose Calculations Logs
CREATE TABLE nimbu_rx.pediatric_safety_gating (
    patient_id VARCHAR(50) PRIMARY KEY,
    calculated_weight_kg FLOAT NOT NULL,
    measured_urine_ph FLOAT NOT NULL,
    mucositis_grade_verified INT CHECK (mucositis_grade_verified IN (0, 1)),
    hardware_monitor_assigned VARCHAR(50) REFERENCES nimbu_rx.hardware_telemetry_mapping(monitor_id)
);
