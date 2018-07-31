package com.educan.oass.services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailSmtp {

    private final String to;
    private final String from = "educan.lk@gmail.com";
    private final String username = "educan.lk@gmail.com";
    private final String password = "Educan@#123";
    private final String subject;
    private final String body;

    public GmailSmtp(String to, String subject, String body) {
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

    public boolean SendEmail() {
        // Assuming you are sending email through relay.jangosmtp.net
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);  // Create a default MimeMessage object.

            message.setFrom(new InternetAddress(from));  // Set From: header field of the header.

            message.setRecipients(Message.RecipientType.TO, // Set To: header field of the header.
                    InternetAddress.parse(to));

            message.setSubject(this.subject);   // Set Subject: header field

            // Now set the actual message
//            message.setText(this.body); 
            message.setContent(this.body, "text/html; charset=utf-8");
            
            Transport.send(message); // Send message

            System.out.println("Sent message successfully....");
            return true;

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        }
    }
}
