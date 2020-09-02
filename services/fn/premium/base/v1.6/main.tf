

combined_ip_list = concat(var.user_defined_iplist, var.apim_iplist, var.services_iplist[var.context.environment_name])
