using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Timers;

namespace GotchaSlots.SMTP.ConsoleApp
{
    public class SendEMails : BaseAction
    {
        // members
        private SMTPFromDataSet.T_FROMRow _drFrom;
        private SMTPToDataSet.T_TORow _drTo;
        private int _counter;

        // class
        public SendEMails() :base()
        {
        }

        // methods
        public void Send()
        {
            Console.WriteLine("Send starting");
            for (int i = 0; i < _smtpFrom.T_FROM.Rows.Count; i++)
            {
                _drFrom = _smtpFrom.T_FROM[i];

                Console.WriteLine("From {0} {1} ", _drFrom.EMF_DESCRIPTION, _drFrom.EMF_EMAIL, _drFrom.EMF_RECENT_DATETIME);
                if (_drFrom.EMF_RECENT_DATETIME < DateTime.Now.AddDays(-1))
                {
                    SmtpClient smtpClient = new SmtpClient(_drFrom.EMF_SMTP, 25);
                    smtpClient.Credentials = new NetworkCredential("mail@gotchaslots.com", "RTsry633");

                    _counter = 0;

                    while (_counter < 500 && _smtpTo.T_TO.Rows.Count > 0)
                    {
                        SMTPToDataSet.T_TORow _drTo;

                        try
                        {
                            _drTo = _smtpTo.T_TO[0];

                            // get sent xml
                            string sentFileName = "SentEmails_" + _drTo.EMT_EMAIL.Substring(0, 3).ToUpper() + ".xml";
                            SMTPSentDataSet dsSent = new SMTPSentDataSet();
                            try
                            {
                                dsSent.ReadXml(sentFileName);
                            }
                            catch
                            {
                                dsSent = new SMTPSentDataSet();
                                dsSent.WriteXml(sentFileName);
                            }

                            if (dsSent.T_SENT.FindByEMS_EMAIL(_drTo.EMT_EMAIL) == null)
                            {
                                using (MailMessage mailMessage = new MailMessage(new MailAddress(_drFrom.EMF_EMAIL, _drFrom.EMF_DESCRIPTION),
                                    new MailAddress(_drTo.EMT_EMAIL, _drTo.EMT_DESCRIPTION)))
                                {
                                    mailMessage.Attachments.Add(new Attachment("Res/GotchaSlotsHeader.jpg"));
                                    mailMessage.Attachments.Add(new Attachment("Res/GotchaSlotsIcon.jpg"));
                                    mailMessage.Attachments.Add(new Attachment("Res/GotchaSlotsLobby.jpg"));
                                    mailMessage.Attachments.Add(new Attachment("Res/AvaliableOnAppStore.jpg"));
                                    mailMessage.Attachments.Add(new Attachment("Res/AvaliableOnGooglePlay.jpg"));

                                    string locale;
                                    try
                                    {
                                        locale = _drTo.EMT_LOCALE;
                                    }
                                    catch
                                    {
                                        locale = "en";
                                    }

                                    mailMessage.Subject = Subject(locale);
                                    mailMessage.Body = Body(locale).Replace("%Name%", _drTo.EMT_DESCRIPTION);
                                    mailMessage.IsBodyHtml = true;

                                    smtpClient.Send(mailMessage);

                                    Console.WriteLine(_counter + " :Mail sent to:", _drTo.EMT_EMAIL);

                                    if (_drFrom.EMF_RECENT_DATETIME < DateTime.Now.AddDays(-1))
                                    {
                                        _drFrom.EMF_RECENT_DATETIME = DateTime.Now;
                                        _smtpFrom.WriteXml(FROM_FILE_NAME);
                                    }

                                    int sentCounter;
                                    try
                                    {
                                        SMTPFromDataSet.T_FROM_SENTRow drFromSent = _smtpFrom.T_FROM_SENT.FindBySNT_FROM_EMAILSNT_RECENT_DATETIME(_drFrom.EMF_EMAIL, _dtNow);
                                        sentCounter = drFromSent.SNT_COUNT;
                                        sentCounter++;
                                        drFromSent.SNT_COUNT = sentCounter;
                                    }
                                    catch
                                    {
                                        sentCounter = 1;
                                        _smtpFrom.T_FROM_SENT.AddT_FROM_SENTRow(_drFrom.EMF_EMAIL, _dtNow, sentCounter);
                                    }
                                    _smtpFrom.WriteXml(FROM_FILE_NAME);
                                }

                                dsSent.T_SENT.AddT_SENTRow(_drTo.EMT_EMAIL);
                                dsSent.WriteXml(sentFileName);
                            }
                            else
                            {
                                Console.WriteLine("Mail allready sent to:", _drTo.EMT_EMAIL);
                            }
                        }
                        finally
                        {
                            _smtpTo.T_TO.Rows.RemoveAt(0);
                            _smtpTo.WriteXml(ToFileName);
                        }

                        _counter++;
                    }

                    _smtpTo.WriteXml(ToFileName);
                }
            }

            _smtpFrom.WriteXml(FROM_FILE_NAME);

            Console.WriteLine("Send finished");
        }
        protected String Subject(string locale)
        {
            switch (locale.ToUpper())
            {
                case "en":
                    return "New Slots Machine";
                case "he":
                    return "חדש Slots Machine";
                case "sp":
                    return "Nuevo Slots Machine";
                case "ca":
                    return "Tabloide Slots Machine";
                case "hr":
                    return "Tabloid Slots Machine";
                case "cs":
                    return "US Tabloid Slots Machine";
                case "nl":
                    return "Tabloid Slots Machine";
                case "fi":
                    return "Tabloid Slots Machine";
                case "fr":
                    return "Nouveau Slots Machine";
                case "de":
                    return "Neu Slots Machine";
                case "el":
                    return "Ταμπλόιντ Slots Machine";
                case "hu":
                    return "Tabloid Slots Machine";
                case "it":
                    return "Tabloid Slots Machine";
                case "ja":
                    return "新規 Slots Machine";
                case "ko":
                    return "타블로이드 Slots Machine";
                case "no":
                    return "Tabloid Slots Machine";
                case "pl":
                    return "Tabloid Slots Machine";
                case "ro":
                    return "Tabloid Slots Machine";
                case "ru":
                    return "Таблоид Slots Machine";
                case "zh-CN":
                    return "新建 Slots Machine";
                case "sk":
                    return "Tabloid Slots Machine";
                case "sv":
                    return "Tabloid Slots Machine";
                case "th":
                    return "แท็บลอยด์ Slots Machine";
                case "zh-TW":
                    return "小報用紙 (Tabloid) Slots Machine";
                case "tr":
                    return "Slots Machine";
                case "uk":
                    return "Бульварна газета Slots Machine";
                default:
                    return "New Slot Machine!!";
            }
        }
        protected String Body(string locale)
        {
            string appStore;
            string googlePlay;

            switch (locale.ToUpper())
            {
                case "ca":      appStore = "Podeu descarregar-vos jocs de l'App Store";         googlePlay = "Podeu descarregar-vos jocs de l'Google Play";         break;
                case "cs":      appStore = "Hry si můžete stáhnout z App Store";                googlePlay = "Hry si můžete stáhnout z Google Play";                break;
                case "da":      appStore = "Du kan hente spil fra App Store";                   googlePlay = "Du kan hente spil fra Google Play";                   break;
                case "el":      appStore = "Κατεβάστε παιχνίδια από το App Store";              googlePlay = "Κατεβάστε παιχνίδια από το Google Play";              break;
                case "en":      appStore = "You can download games from the App Store";         googlePlay = "You can download games from the Google Play";         break;
                case "fi":      appStore = "Voit ladata pelejä App Storesta";                   googlePlay = "Voit ladata pelejä Google Playsta";                   break;
                case "he":      appStore = "ניתן להוריד משחקים מה-App Store";                   googlePlay = "ניתן להוריד משחקים מה-Google Play";                   break;
                case "hr":      appStore = "Možete preuzeti igre iz App Store";                 googlePlay = "Možete preuzeti igre iz Google Play";                 break;
                case "hu":      appStore = "A játékok letöltésére az App Store használható";    googlePlay = "A játékok letöltésére az Google Play használható";    break;
                case "it":      appStore = "Puoi scaricare giochi da App Store";                googlePlay = "Puoi scaricare giochi da Google Play";                break;
                case "ja":      appStore = "アカウントを表示";                                  googlePlay = "アカウントを表示";                                    break;
                case "ko":      appStore = "App Store에서 게임을 다운로드할 수 있습니다.";      googlePlay = "Google Play에서 게임을 다운로드할 수 있습니다.";      break;
                case "nl":      appStore = "U kunt games downloaden bij de App Store";          googlePlay = "U kunt games downloaden bij de Google Play";          break;
                case "no":      appStore = "Du kan laste ned spill fra App Store";              googlePlay = "Du kan laste ned spill fra Google Play";              break;
                case "ro":      appStore = "Puteți descărca jocuri din App Store";              googlePlay = "Puteți descărca jocuri din Google Play";              break;
                case "ru":      appStore = "Вы можете загружать игры из App Store";             googlePlay = "Вы можете загружать игры из Google Play";             break;
                case "sk":      appStore = "Hry môžete sťahovať z App Store";                   googlePlay = "Hry môžete sťahovať z Google Play";                   break;
                case "sp":      appStore = "Puede descargar juegos desde la tienda App Store";  googlePlay = "Puede descargar juegos desde la tienda Google Play";  break;
                case "sv":      appStore = "Du kan hämta spel från App Store";                  googlePlay = "Du kan hämta spel från App Store";                    break;
                case "th":      appStore = "คุณสามารถดาวน์โหลดเกมได้จาก\nApp Store";                 googlePlay = "คุณสามารถดาวน์โหลดเกมได้จาก\nGoogle Play";                 break;
                case "tr":      appStore = "App Store’dan oyun indirebilirsiniz";               googlePlay = "Google Play’dan oyun indirebilirsiniz";               break;
                case "uk":      appStore = "Ігри можна завантажити з App Store";                googlePlay = "Ігри можна завантажити з Google Play";                break;
                case "zh-CN":   appStore = "显示帐户";                                          googlePlay = "显示帐户";                                            break;
                case "zh-TW":   appStore = "您可以從 App Store 下載遊戲";                       googlePlay = "您可以從 Google Play 下載遊戲";                       break;
                default:        appStore = "You can download games from the App Store";         googlePlay = "You can download games from the Google Play";         break;
            }

            // upload image to web site
            string body = "<html><body><span style='color: #9900cc'><span style='font-size: 24pt; font-family: Candice Com'>GotchaSlots<br /></span><br /></span><img src='http://www.gotchaslots.com/res/emails/GotchaSlotsLobby.jpg' alt='GotchaSlots' /><br /><a href='https://itunes.apple.com/us/app/gotchaslots/id795214708?l=iw&ls=1&mt=8'><img src='http://www.gotchaslots.com/res/emails/AvaliableOnAppStore.jpg' style='border-style: none' /><br /><%Get it on AppStore%></a><br /><a href='https://play.google.com/store/apps/details?id=air.com.gotchaslots.slots'><img src='http://www.gotchaslots.com/res/emails/AvaliableOnGooglePlay.jpg' style='border-style: none' /><br /><%Get it on GooglePlay%></a><br /></body></html>";
            return body.Replace("<%Get it on AppStore%>", appStore).Replace("<%Get it on GooglePlay%>", googlePlay);
        }
    }
}