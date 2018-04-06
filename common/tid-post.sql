
-- Note: disconnect no longer necessary with 11g+
-- disconnect to ensure all trace data flushed
-- the disconnect must be done in the called script
-- otherwise the values of the defined vars are lost

-- now get the trace file, or other processing

@@scp '&&traceowner@&&tracehost:&&tracefile' '.'
--@@mrskew '&&traceowner@&&tracehost' '&&tracefile'
--@@plan '&&traceowner@&&tracehost' '&&tracefile'
--@@tkprof '&&traceowner@&&tracehost' '&&tracefile'



