 select distinct
   e.nodeid as _nodeid,
   e.ipaddr as _ipaddr,
   e.eventlogmsg as _eventlogmsg,
   e.eventsource as _eventsource,
   e.serviceid as _serviceid,
   e.eventparms as _eventparms,
   e.eventseverity as _eventseverity,
   e.eventdisplay as _eventdisplay,
   e.eventlog as _eventlog,
   e.eventuei as _lowuei,
   'uei.opennms.org/custom/'||se.event||'order' as _orderuei,
   now() as _ts
 from
   events e
   join supplyevents se
     on e.eventuei = 'uei.opennms.org/custom/'||se.event||'low'
 where
   e.eventuei='uei.opennms.org/custom/'||se.event||'low' and
   e.eventackuser is null and
   not exists (
     select
       e2.eventid
     from
       events e2
     where
       e2.nodeid=e.nodeid and
       e2.eventuei='uei.opennms.org/custom/'||se.event||'order' and
       e2.eventackuser is null
   );