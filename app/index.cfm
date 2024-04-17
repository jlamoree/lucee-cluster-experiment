<cfscript>
    node_name = server.system.environment.NODE_NAME;
    session[node_name] = "Touched #dateTimeFormat(now(), 'yyyy-mm-dd HH:NN:SS')#";
    dump var="#session#";
</cfscript>
