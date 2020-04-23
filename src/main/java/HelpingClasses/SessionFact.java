package HelpingClasses;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class SessionFact {
    static SessionFactory sessionFactory;
    public static SessionFactory getSessionFact()
    {
//        Configuration cfg = new Configuration();
//        cfg.configure("hibernate.cfg.xml");
//        serviceRegistry = new StandardServiceRegistryBuilder().applySettings(
//                cfg.getProperties()).build();
//        sf = cfg.buildSessionFactory();
//        System.out.println(sf);
//        System.out.println("build session factory -------Done");
//        return sf;
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure() // configures settings from hibernate.cfg.xml
                .build();
        try {
            sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
        }
        catch (Exception e) {
            // The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
            // so destroy it manually.
            StandardServiceRegistryBuilder.destroy( registry );
        }
        return sessionFactory;

    }
}
