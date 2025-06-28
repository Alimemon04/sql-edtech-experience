# 🏢 Byju's SQL Reports

This folder contains real-world SQL queries used during my time at Byju's as part of the Analytics team.

## 📄 `tutor_schedule_report_byjus.sql`

**Purpose**:  
Generates a detailed report of tutor batch schedules, converting UTC session times to IST and joining relevant subject info.

**Key Features**:
- Timezone conversion from UTC to IST
- Use of `TO_CHAR` for readable dates
- Joins across `batch_schedules` and `raw_topics`
- Parameterized batch filtering

> Note: The variable `{{ batch_id }}` is expected to be replaced during query execution in the internal tool or script.
