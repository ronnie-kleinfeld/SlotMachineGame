using System;
using System.Collections.Generic;
using System.Text;

namespace GotchaSlots.SMTP.ConsoleApp
{
    public class BaseAction
    {
        // consts
        protected const string FROM_FILE_NAME = "SMTPFrom.xml";
        protected const string TO_FILE_NAME = "#Month#/SMTPTo#Day#.xml";

        // members
        protected SMTPFromDataSet _smtpFrom;
        protected SMTPToDataSet _smtpTo;
        protected DateTime _dtNow;

        // properties
        protected String ToFileName
        {
            get
            {
                return TO_FILE_NAME.Replace("#Month#", DateTime.Now.Month.ToString()).Replace("#Day#", DateTime.Now.Day.ToString());
            }
        }

        // class
        public BaseAction()
        {
            _dtNow = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

            InitT_FROM();
            InitT_TO();
        }

        // init
        private void InitT_FROM()
        {
            _smtpFrom = new SMTPFromDataSet();

            try
            {
                _smtpFrom.ReadXml(FROM_FILE_NAME);
            }
            catch
            {
            }

            AddT_FORM("aaadi", "aaadi@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ahmed", "ahmed@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ai", "ai@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("amanda", "amanda@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ana", "ana@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("angel", "angel@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("aoi", "aoi@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("arav", "arav@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("aya", "aya@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ben", "ben@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("bi", "bi@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("bob", "bob@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("brianna", "brianna@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("cai", "cai@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("camila", "camila@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("chloe", "chloe@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("dana", "dana@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("danny", "danny@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("diya", "diya@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("dong", "dong@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("emily", "emily@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("emma", "emma@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("erica", "erica@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("esther", "esther@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ethan", "ethan@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("fatemeh", "fatemeh@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("fatima", "fatima@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("fatma", "fatma@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("fb2", "fb2@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("feng", "feng@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("fiona", "fiona@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("florencia", "florencia@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("francesco", "francesco@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("hina", "hina@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("hiroto", "hiroto@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ian", "ian@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("isabella", "isabella@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("jada", "jada@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("jana", "jana@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("jian", "jian@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("jie", "jie@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("jing", "jing@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("john", "john@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("juan", "juan@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("julia", "julia@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("leah", "leah@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("leo", "leo@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("li", "li@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("liam", "liam@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("liang", "liang@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("lola", "lola@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("luca", "luca@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("lucas", "lucas@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("mail", "mail@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("mali", "mali@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("maria", "maria@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("mary", "mary@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("messi", "messi@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("mia", "mia@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("peng", "peng@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("rimas", "rimas@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ronaldo", "ronaldo@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("sai", "sai@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("santiago", "santiago@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("seo-yeon", "seo-yeon@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("sofai", "sofai@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("sofia", "sofia@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("somchai", "somchai@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("somporn", "somporn@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("sophia", "sophia@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("thiago", "thiago@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("valentina", "valentina@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("valeria", "valeria@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("wei", "wei@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("xavier", "xavier@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("yan", "yan@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("ying", "ying@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("youssef", "youssef@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("yui", "yui@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("yuto", "yuto@gotchaslots.com", "smtpout.secureserver.net");
            AddT_FORM("zhen", "zhen@gotchaslots.com", "smtpout.secureserver.net");

            _smtpFrom.WriteXml(FROM_FILE_NAME);
        }
        private void AddT_FORM(string description, string eMail, string smtp)
        {
            try
            {
                _smtpFrom.T_FROM.AddT_FROMRow(description, eMail, smtp, _dtNow.AddDays(-1));
            }
            catch
            {
            }
        }

        private void InitT_TO()
        {
            _smtpTo = new SMTPToDataSet();

            try
            {
                _smtpTo.ReadXml(ToFileName);
            }
            catch
            {
                Console.WriteLine("Failed to load the SMTPTo file {0}", ToFileName);
            }
        }
    }
}