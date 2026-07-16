-- ============================================================================
-- SQL EXTRACTIONS FOR TELEHEALTH ADULT STREAMING ALERTS
-- Target System: PostgreSQL 15+ / Distributed Enterprise Health Architecture
-- ============================================================================

SET search_path TO nimbu_rx;

-- 1. Telehealth Adult Monitoring Session Ledger
CREATE TABLE nimbu_rx.telehealth_adult_sessions (
    session_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    assigned_hardware_id VARCHAR(50) REFERENCES nimbu_rx.hardware_telemetry_mapping(monitor_id),
    connection_status VARCHAR(20) CHECK (connection_status IN ('CONNECTED', 'DISCONNECTED', 'STREAM_ERROR')),
    baseline_room_decibel FLOAT DEFAULT 35.0,
    last_sync_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Real-Time Acoustic Distress Event Log
CREATE TABLE nimbu_rx.adult_acoustic_alerts (
    alert_id SERIAL PRIMARY KEY,
    session_id VARCHAR(50) REFERENCES nimbu_rx.telehealth_adult_sessions(session_id),
    measured_decibel_peak FLOAT NOT NULL,
    detected_frequency_hz FLOAT NOT NULL,
    visual_compliance_confirmed BOOLEAN DEFAULT FALSE,
    action_taken TEXT NOT NULL,
    clinician_sign_off_id VARCHAR(50) NOT NULL
);

-- 3. Home Care Adherence and Symptoms Matrix
CREATE TABLE nimbu_rx.home_adherence_tracking (
    tracking_id SERIAL PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    recorded_urine_ph FLOAT CHECK (recorded_urine_ph BETWEEN 4.5 AND 9.0),
    rinse_step_completed BOOLEAN NOT NULL,
    gastric_heartburn_severity VARCHAR(20) CHECK (gastric_heartburn_severity IN ('NONE', 'MILD', 'MODERATE', 'SEVERE')),
    session_alert_triggered BOOLEAN DEFAULT FALSE
);
