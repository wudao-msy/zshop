package com.zte.level_46.utils;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.util.HashSet;
import java.util.Set;

/**
 * Author:msy
 * Date:2020-08-07 15:13
 * Description:<描述>
 */
public class JedisClients {

    public static JedisCluster initJedisClusters(){
        Set<HostAndPort> set=new HashSet<>();
        set.add(new HostAndPort("192.168.203.135",7001));
        set.add(new HostAndPort("192.168.203.135",7002));
        set.add(new HostAndPort("192.168.203.135",7003));
        set.add(new HostAndPort("192.168.203.135",7004));
        set.add(new HostAndPort("192.168.203.135",7005));
        set.add(new HostAndPort("192.168.203.135",7006));
        JedisCluster cluster=new JedisCluster(set);
        return cluster;
    }

    public static Boolean exists(String key) {
        JedisCluster jedisClusters=initJedisClusters();
        return jedisClusters.exists(key);
    }


    public static String get(String key) {
        JedisCluster jedisClusters=initJedisClusters();
        return jedisClusters.get(key);
    }


    public static String set(String key, String value) {

        JedisCluster jedisClusters=initJedisClusters();
        return jedisClusters.set(key, value);
    }

}
