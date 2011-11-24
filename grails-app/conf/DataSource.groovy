dataSource {
    pooled = true
    driverClassName = "om.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    username = "root"
    password = "root"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://127.0.0.1:3306/db_doganella"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://127.0.0.1:3306/db_doganella"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://127.0.0.1:3306/db_doganella"
        }
    }
}
