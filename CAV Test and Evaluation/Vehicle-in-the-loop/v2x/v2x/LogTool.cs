using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace v2x
{
    // 示例：
    //LogTool log = new LogTool(this.GetType().Name);
    //log.WriteLine("log输出信息");

    /// <summary>
    /// 日志信息输出类
    /// </summary>
    public class LogTool
    {

        public string logFile = ""; // log文件路径

        /// <summary>
        /// 默认log文件
        /// </summary>
        public LogTool()
        {
            string logFile = AppDomain.CurrentDomain.BaseDirectory + "/log/log.txt";
            Init(logFile);
        }

        /// <summary>
        /// 指定名称，创建文件
        /// </summary>
        public LogTool(string LogName)
        {
            string logFile = AppDomain.CurrentDomain.BaseDirectory + "/log/" + LogName + ".txt";
            Init(logFile);
        }

        /// <summary>
        /// 初始设置，创建路径、文件
        /// </summary>
        private void Init(string logFile)
        {
            this.logFile = logFile;

            // 创建路径
            String dir = System.IO.Path.GetDirectoryName(logFile);
            if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

            // 创建文件
            if (!File.Exists(logFile))
            {
                FileStream fs = File.Create(logFile);
                fs.Close();
            }
            else
            {
                File.WriteAllText(logFile, String.Empty);
            }
        }

        string FORMAT = "[yyyy-MM-dd_HH:mm:ss_ffff] ";

        /// <summary>
        /// 追加一条log信息
        /// </summary>
        public void Write(string text)
        {
            using (StreamWriter sw = new StreamWriter(logFile, true, Encoding.UTF8))
            {
                sw.Write(DateTime.Now.ToString(FORMAT) + text);
            }
        }

        /// <summary>
        /// 追加一行log信息
        /// </summary>
        public void WriteLine(string text)
        {
            text += "\r\n";
            using (StreamWriter sw = new StreamWriter(logFile, true, Encoding.UTF8))
            {
                sw.Write(DateTime.Now.ToString(FORMAT) + text);
            }
        }
    }
}

