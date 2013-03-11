 select distinct
   now() as _ts,
   e.nodeid as _nodeid,
   e.eventuei as _fulluei,
   'uei.opennms.org/custom/'||se.event||'order' as _orderuei,
   'uei.opennms.org/custom/'||se.event||'low' as _lowuei
 from
   events e
   join supplyevents se
     on e.eventuei = 'uei.opennms.org/custom/'||se.event||'full'
 where
   eventuei='uei.opennms.org/custom/'||se.event||'full' and
   e.eventackuser is null and
   lower(e.eventdescr) not like '%configuration has been changed%';