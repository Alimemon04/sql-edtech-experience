SELECT 
    batch_id, -- Selects the batch identifier.
    
    TO_CHAR(batch_schedules.session_starts_at AT TIME ZONE 'UTC' AT TIME ZONE 'IST', 'DD-Mon-YYYY') AS schedule_date, 
    -- Converts the session start time from UTC to IST and formats it as 'DD-Mon-YYYY'.
    
    tth_batch_schedule_id, -- Selects the ID for the TTH batch schedule.
    
    batch_schedules.id as cms_schedule_id, -- Selects the schedule ID from the batch_schedules table and renames it as cms_schedule_id.
    
    batch_schedules.session_starts_at + interval '330 minutes' AS actual_start_time, 
    -- Converts the session start time to IST by adding 330 minutes (5 hours 30 minutes).
    
    batch_schedules.session_ends_at + interval '330 minutes' AS actual_end_time, 
    -- Converts the session end time to IST by adding 330 minutes (5 hours 30 minutes).
    
    batch_schedules.raw_topic_id, -- Selects the raw_topic_id associated with the schedule.
    
    raw_topics.subject -- Retrieves the subject name from the raw_topics table.
    
FROM 
    batch_schedules -- Specifies the main table from which the data is being selected.
    
JOIN 
    raw_topics ON batch_schedules.raw_topic_id = raw_topics.id 
    -- Joins the batch_schedules table with the raw_topics table based on the raw_topic_id.
    
WHERE 
    batch_schedules.batch_id IN ({{ batch_id }}) 
    -- Filters the records to include only those where the batch_id is in the specified list.
    
ORDER BY 
    batch_id ASC, -- Orders the results by batch_id in ascending order.
    
    schedule_date ASC; -- Orders the results by schedule_date in ascending order.
