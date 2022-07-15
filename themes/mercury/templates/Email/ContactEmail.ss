<!DOCTYPE html>
<html lang="en">

<head>
    <title>$Subject</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
     <style type="text/css">
        body,
        table,
        td,
        a {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        table,
        td {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        img {
            -ms-interpolation-mode: bicubic;
        }

        /* RESET STYLES */
        img {
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }

        table {
            border-collapse: collapse !important;
        }

        body {
            height: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
        }

        /* iOS BLUE LINKS */
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        /* GMAIL BLUE LINKS */
        u+#body a {
            color: inherit;
            text-decoration: none;
            font-size: inherit;
            font-family: inherit;
            font-weight: inherit;
            line-height: inherit;
        }

        /* SAMSUNG MAIL BLUE LINKS */
        #MessageViewBody a {
            color: inherit;
            text-decoration: none;
            font-size: inherit;
            font-family: inherit;
            font-weight: inherit;
            line-height: inherit;
        }

        /* These rules set the link and hover states, making it clear that links are, in fact, links. */
        /* Embrace established conventions like underlines on links to keep emails accessible. */
        a {
            color: #B200FD;
            font-weight: 600;
            text-decoration: underline;
        }

        a:hover {
            color: #000000 !important;
            text-decoration: none !important;
        }

        /* These rules adjust styles for desktop devices, keeping the email responsive for users. */
        /* Some email clients don't properly apply media query-based styles, which is why we go mobile-first. */
        @media screen and (min-width:600px) {
            h1 {
                font-size: 48px !important;
                line-height: 48px !important;
            }

            .intro {
                font-size: 24px !important;
                line-height: 36px !important;
            }
        }
    </style>
     
</head>
 

<body style="margin: 0 !important; padding: 0 !important;">
    <!-- This ghost table is used to constrain the width in Outlook. The role attribute is set to presentation to prevent it from being read by screenreaders. -->
    <!--[if (gte mso 9)|(IE)]>
    <table cellspacing="0" cellpadding="0" border="0" width="720" align="center" role="presentation"><tr><td>
    <![endif]-->
    <!-- The role and aria-label attributes are added to wrap the email content as an article for screen readers. Some of them will read out the aria-label as the title of the document, so use something like "An email from Your Brand Name" to make it recognizable. -->
    <!-- Default styling of text is applied to the wrapper div. Be sure to use text that is large enough and has a high contrast with the background color for people with visual impairments. -->
    <div role="article" aria-label="An email from Your Brand Name" lang="en" style="background-color: white; color: #2b2b2b; font-family: 'Avenir Next', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 18px; font-weight: 400; line-height: 28px; margin: 0 auto; max-width: 720px; padding: 40px 20px 40px 20px;">

        <header>
            <h1 style="color: #000000; font-size: 32px; font-weight: 800; line-height: 32px; margin: 48px 0; text-align: center;">
                New Message for
            </h1>
        </header>

        <main>
            <div style="background-color: ghostwhite; border-radius: 4px; padding: 24px 48px;">
                <!--[if (gte mso 9)|(IE)]>
                <table cellspacing="0" cellpadding="0" border="0" width="720" align="center" role="presentation"><tr><td style="background-color: ghostwhite; padding: 24px 48px 24px 48px;">
                <![endif]-->

                <p>
                    To keep your account secure, you need to update your password. Use the link below to reset your password, after which you can log in as usual.
                </p>

                <p><strong>Name:&nbsp;&nbsp;&nbsp;</strong>$Title</p>
                <p><strong>Phone:&nbsp;&nbsp;</strong>$Phone</p>
                <p><strong>Email:&nbsp;&nbsp;&nbsp;&nbsp;</strong><a href="mailto:$Email" style="color: #377cff; text-decoration: underline;">$Email</a></p>

                <p>
                    <strong>Message: </strong>
                    <br>
                    $Message
                </p>
                <!--[if (gte mso 9)|(IE)]>
                </td></tr></table>
                <![endif]-->
            </div>
        </main>

        <!-- Footer information. Footer is a useful landmark element. -->
        <footer>
            <!-- Since this is a transactional email, you aren't required to include opt-out language. -->
            <p style="font-size: 14px; font-weight: 400; font-style:italic;line-height: 24px; margin-top: 48px;color:#666">
                This message (including any attachments) may contain confidential, proprietary, privileged and/or private information. The information is intended to be for the use of the individual or entity designated above. If you are not the intended recipient of this message, please notify the sender immediately, and delete the message and any attachments. Any disclosure, reproduction, distribution or other use of this message or any attachments by an individual or entity other than the intended recipient is prohibited.
            </p>


        </footer>

    </div>
    <!--[if (gte mso 9)|(IE)]>
    </td></tr></table>
    <![endif]-->
     
</body>

</html>