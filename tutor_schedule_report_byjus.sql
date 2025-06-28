-- Query: Tutor Batch Schedule Report (Byju's)
-- Author: Mohammad Ali Memon
-- Context: Used to retrieve batch schedule data with converted IST timestamps and related subjects

SELECT 
    batch_id,  -- Batch identifier

    TO_CHAR(batch_schedules.session_starts_at AT TIME ZONE 'UTC' AT TIME ZONE 'IST', 'DD-Mon-YYYY') AS schedule_date,
    -- Converts session start time from UTC to IST and formats it

    tth_batch_schedule_id,  -- TTH batch schedule ID

    batch_schedules.id as cms_schedule_id,  -- CMS schedule ID

    batch_schedules.session_starts_at + interval '330 minutes' AS actual_start_time,
    -- Converts UTC start time to IST (5h 30m offset)

    batch_schedules.session_ends_at + interval '330 minutes' AS actual_end_time,
    -- Converts UTC end time to IST (5h 30m offset)

    batch_schedules.raw_topic_id,  -- Topic ID

    raw_topics.subject  -- Subject from the raw_topics table

FROM 
    batch_schedules

JOIN 
    raw_topics ON batch_schedules.raw_topic_id = raw_topics.id

WHERE 
    batch_schedules.batch_id IN ({{ batch_id }});
