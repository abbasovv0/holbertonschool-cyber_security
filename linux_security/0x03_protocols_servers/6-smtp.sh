#!/bin/bash
grep "^smtpd_tls_security_level" /etc/postfix/main.cf || echo "STARTTSL not configured"
