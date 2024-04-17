component {

    this.name = "experiment";

    this.cache.connections["redisSessionCache"] = {
        class: "lucee.extension.io.cache.redis.simple.RedisCache",
        bundleName: "redis.extension",
        custom: {
            minIdle: 8,
            maxTotal: 40,
            maxIdle: 24,
            host: server.system.environment.REDIS_SERVER,
            port: server.system.environment.REDIS_PORT,
            socketTimeout: 2000,
            liveTimeout: 3600000,
            idleTimeout: 60000,
            timeToLiveSeconds: 0,
            testOnBorrow: true,
            rnd: 1
        },
        readOnly: false,
        storage: true,
        default: ""
    };

    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0);
    this.sessionType = "cfml";
    this.sessionCluster = true;
    this.sessionStorage = "redisSessionCache";
    this.setClientCookies = true;
    this.sessionCookie = {
      httpOnly: true,
      secure: true,
      timeout: "-1",
      sameSite: "strict"
    };

}
