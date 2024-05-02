package utils;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;


public class RedisUtil {
    private static JedisPool jedisPool = null;

    static {
        JedisPoolConfig poolConfig = new JedisPoolConfig();
        poolConfig.setMaxTotal(8);
        poolConfig.setMaxIdle(8);
        poolConfig.setMinIdle(0);
        poolConfig.setMaxWaitMillis(10000);
        jedisPool = new JedisPool(poolConfig, "localhost", 6379, 10000);
    }

    public static JedisPool getJedisPool() {
        return jedisPool;
    }
}