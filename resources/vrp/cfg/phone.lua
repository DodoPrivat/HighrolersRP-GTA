
local cfg = {}

-- size of the sms history
cfg.sms_history = 15

-- maximum size of an sms
cfg.sms_size = 500

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["Police"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 300, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~Police alert:~n~~s~",
    notify = "~b~You called the police.",
    answer_notify = "~b~The police are coming."
  },
  ["EMS"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 300, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "~r~Emergency alert:~n~~s~",
    notify = "~b~You called the EMS",
    answer_notify = "~b~EMS are coming."
  },
  ["News"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 300, -- 5 minutes
    alert_permission = "news.service",
    alert_notify = "~r~News alert:~n~~s~",
    notify = "~b~You called Weasel News",
    answer_notify = "~b~Weasel News is on the way!"
  },
  ["Taxi"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "taxi.service",
    alert_notify = "~y~Taxi alert:~n~~s~",
    notify = "~y~You called a taxi.",
    answer_notify = "~y~A taxi is coming."
  },
  ["Tow"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "repair.service",
    alert_notify = "~y~Tow Alert :~n~~s~",
    notify = "~y~You called a tow.",
    answer_notify = "~y~A Tow Truck is on the way!"
    }
}

return cfg
