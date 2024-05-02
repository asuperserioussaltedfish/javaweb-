package service;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import utils.RedisUtil;


public class TokenBlackListService {
    private JedisPool jedisPool;

    public TokenBlackListService() {
        this.jedisPool = RedisUtil.getJedisPool();
    }

    public static void main(String[] args) {
        TokenBlackListService service = new TokenBlackListService();
        service.addToBlackList("token1");
    }

    public void addToBlackList(String token) {
        try (Jedis jedis = jedisPool.getResource()) {
            jedis.sadd("tokenBlackList", token);
            System.out.println("Token added to blacklist: " + token);
        }
    }

    public boolean isTokenBlacklisted(String token) {
        try (Jedis jedis = jedisPool.getResource()) {
            return jedis.sismember("tokenBlackList", token);
        }
    }
}
