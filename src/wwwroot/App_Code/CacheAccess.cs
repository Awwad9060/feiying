using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.Caching;

/// <summary>
/// 辅助类，用于缓存操作
/// </summary>
public class CacheAccess
{
    /// <summary>
    /// 将对象加入到缓存中
    /// </summary>
    /// <param name="cacheKey">缓存键</param>
    /// <param name="cacheObject">缓存对象</param>
    /// <param name="time">缓存过期时间</param>
    public static void SaveToCache(string cacheKey, object cacheObject, DateTime time)
    {
        Cache cache = HttpRuntime.Cache;
        cache.Insert(cacheKey, cacheObject, null, time, TimeSpan.Zero);
    }
    /// <summary>
    /// 缓存对象
    /// </summary>
    /// <param name="cacheKey">缓存键</param>
    /// <param name="cacheObject">缓存对象</param>
    /// <param name="filePath">缓存依赖项(文件的路径)</param>
    public static void SaveToCache(string cacheKey, object cacheObject, string filePath)
    {
        Cache cache = HttpRuntime.Cache;
        cache.Insert(cacheKey, cacheObject, new CacheDependency(filePath));
    }
    /// <summary>
    /// 将对象加入到缓存中
    /// </summary>
    /// <param name="cacheKey">缓存键</param>
    /// <param name="cacheObject">缓存对象</param>
    /// <param name="dependency">缓存依赖项</param>
    /// <param name="dependency">缓存过期时间</param>
    public static void SaveToCache(string cacheKey, object cacheObject, CacheDependency dependency, DateTime time)
    {
        Cache cache = HttpRuntime.Cache;
        cache.Insert(cacheKey, cacheObject, dependency, time, TimeSpan.Zero);
    }
    /// <summary>
    /// 删除缓存
    /// </summary>
    /// <param name="cacheKey"></param>
    public static void RemoveCache(string cacheKey)
    {
        Cache cache = HttpRuntime.Cache;
        cache.Remove(cacheKey);
    }
    /// <summary>
    /// 清除所有缓存信息
    /// </summary>
    public static void RemoveAllCache()
    {
        Cache cache = HttpRuntime.Cache;
        IDictionaryEnumerator CacheEnum = cache.GetEnumerator();

        while (CacheEnum.MoveNext())
        {
            cache.Remove(CacheEnum.Key.ToString());
        }
    }
    /// <summary>
    /// 获取所有缓存信息

    /// </summary>
    /// <returns></returns>
    public static DataTable GetAllFormCache()
    {
        DataTable dt = new DataTable("CacheList");
        dt.Columns.Add("id");
        dt.Columns.Add("key");
        Cache cache = HttpRuntime.Cache;
        IDictionaryEnumerator CacheEnum = cache.GetEnumerator();
        while (CacheEnum.MoveNext())
        {
            if (CacheEnum.Key.ToString().ToLower().Equals("rewriterconfig"))
                continue;
            dt.Rows.Add(dt.Rows.Count + 1, CacheEnum.Key.ToString());
        }
        return dt;
    }
    /// <summary>
    /// 从缓存中取得对象，不存在则返回null
    /// </summary>
    /// <param name="cacheKey">缓存键</param>
    /// <returns>获取的缓存对象</returns>
    public static object GetFromCache(string cacheKey)
    {
        Cache cache = HttpRuntime.Cache;
        return cache[cacheKey];
    }
}
