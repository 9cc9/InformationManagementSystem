function PrintPart(id_str)//id-str 内容中的id
{
    var el = document.getElementById(id_str);
    var iframe = document.createElement('IFRAME');
    var doc = null;
    iframe.setAttribute('style', 'position:absolute;width:0px;height:0px;left:-500px;top:-500px;');
    document.body.appendChild(iframe);
    doc = iframe.contentWindow.document;
    doc.write('<div>' + el.innerHTML + '</div>');
    doc.close();
    iframe.contentWindow.focus();
    iframe.contentWindow.print();
    if (navigator.userAgent.indexOf("MSIE") > 0) {
        document.body.removeChild(iframe);
    }
}

// 打印框架
function PrintBaseItem(print_string) {
    var iframe = document.createElement('IFRAME');
    var doc = null;
    iframe.setAttribute('style', 'position:absolute;width:0px;height:0px;left:-500px;top:-500px;');
    document.body.appendChild(iframe);
    doc = iframe.contentWindow.document;
    doc.write(print_string);
    doc.close();
    iframe.contentWindow.focus();
    iframe.contentWindow.print();
    if (navigator.userAgent.indexOf("MSIE") > 0)  document.body.removeChild(iframe);
}

// 增加表格thead的打印
function AddTheadInformation(print_string, ths) {
    print_string += "<thead><tr>";
    for (var i = 0; i < ths.length; i++) {
        print_string += "<th style='border: 1px solid silver;'>" + ths[i] + "</th>";
    }
    print_string += "</tr></thead>";
    return print_string;
}

// 增加标题打印信息
function AddPrintTitleInformation(title) {
    return "<div style='text-align: center;'>" + title + "<div/>";
}

// 增加结尾打印信息
function AddPrintEndingInformation(print_string) {
    var current_time = new Date();
    print_string += "<div style='clear:both; text-align: left;padding:50px;'>&nbsp;&nbsp;&nbsp;&nbsp;研究生院经手人：</div>";
    print_string += "<div style='padding: 50px;text-align: right;'>" + current_time.getFullYear() + "年" + (current_time.getMonth() + 1) + "月" + current_time.getDate() + "日</div>";
    print_string += "</div>";
    return  print_string;
}

// 打印资费条目
function PrintFundItem(fund_item, project_type, student_name)//id-str 内容中的id
{
    PrintBaseItem(CreatePrintFundString(fund_item, project_type, student_name));
}

// 创建打印文本
function CreatePrintFundString(fund_item, project_type, student_name) {
    var print_string = AddPrintTitleInformation(project_type + "获得者经费申请报销单");
    print_string += "<div style='padding: 200px 0 200px 0; text-align: left;'>&nbsp;&nbsp;&nbsp;&nbsp;" + student_name + "于" + fund_item.fund_created_at;
    print_string += "申请报销参加高水平会议" + fund_item.conference + "元，发表高水平论文";
    print_string += fund_item.paper + "元，查询文献";
    print_string += fund_item.search_paper + "元，其他可以报销";
    print_string += fund_item.other + "元，共计";
    print_string += fund_item.total + "元。</div>";
    return AddPrintEndingInformation(print_string);
}

// 打印结题项目信息条目
function PrintProjectItem(project, achieve_items)//achieve_items json
{
    PrintBaseItem(CreatePrintProjectString(project, achieve_items));
}

// 结题项目信息
function CreatePrintProjectString(project, achieve_items) {
    var data_key = ["姓名", "学号", "专业", "导师", "学院", "拟定学位论文题目", "获得资助类型", "获得资助时间", "结题时间"];
    var data_value = [project.student_name, project.student_school_number, project.student_major, project.student_teacher_name, project.student_academy,
        project.paper_title, project.project_type, project.started_at, project.ended_at];  // print information
    var print_string = AddPrintTitleInformation(project.project_type + "获得者答辩申请单");
    print_string += "<table style='padding: 100px;'>";
    for (var i = 0; i < data_key.length; i++) {
        print_string += "<tr><td style='border: 1px solid silver;'>" + data_key[i] + "</td><td style='border: 1px solid silver;'>" + data_value[i] + "</td></tr>";
    }
    print_string += "</table>";
    return AddPrintEndingInformation(CreatePrintAchievementString(print_string, achieve_items));
}

// 打印成果信息
function CreatePrintAchievementString(print_string, achieve_items) {
    print_string += "<table cellspacing='1'>";
    for (var i = 0; i < achieve_items.periodical_papers.length; i++) {  // 期刊论文
        print_string += "<tr class='index_table_second_specs'>" +
            "<td style='border: 1px solid silver;'>期刊论文</td>" +
            "<td style='border: 1px solid silver;'>学术论文题目:" + achieve_items.periodical_papers[i].paper_title +
            "<br/>期刊名字:" + achieve_items.periodical_papers[i].periodical_name +
            "<br/>期刊类别:" + achieve_items.periodical_papers[i].periodical_type +
            "</td><td style='border: 1px solid silver;'>发表期卷:" + achieve_items.periodical_papers[i].periodical_volume +
            "<br/>SCI期刊影响因子:" + achieve_items.periodical_papers[i].sci_impact_factor +
            "<br/>JCR分区:" + achieve_items.periodical_papers[i].jcr +
            "</td><td style='border: 1px solid silver;'>" + achieve_items.periodical_papers[i].achieved_at + "</td></tr>";
    }

    for (var i = 0; i < achieve_items.conference_papers.length; i++) {  // 会议论文
        print_string += "<tr class='index_table_second_specs'>" +
            "<td style='border: 1px solid silver;'>会议论文</td>" +
            "<td style='border: 1px solid silver;'>学术论文题目:" + achieve_items.conference_papers[i].paper_title +
            "</td><td style='border: 1px solid silver;'>会议名字:" + achieve_items.conference_papers[i].conference_name +
            "<br/>发表期卷:" + achieve_items.conference_papers[i].periodical_volume +
            "</td><td style='border: 1px solid silver;'>" + achieve_items.conference_papers[i].achieved_at + "</td></tr>";
    }

    for (var i = 0; i < achieve_items.patents.length; i++) {  // 专利
        print_string += "<tr class='index_table_second_specs'>" +
            "<td style='border: 1px solid silver;'>专利</td>" +
            "<td style='border: 1px solid silver;'>专利名称:" + achieve_items.patents[i].patent_name +
            "</td><td style='border: 1px solid silver;'>专利号:" + achieve_items.patents[i].patent_id +
            "<br/>专利类型:" + achieve_items.patents[i].patent_type +
            "</td><td style='border: 1px solid silver;'>" + achieve_items.patents[i].achieved_at + "</td></tr>";
    }

    for (var i = 0; i < achieve_items.academic_exchanges.length; i++) {  // 学术交流
        print_string += "<tr class='index_table_second_specs'>" +
            "<td style='border: 1px solid silver;'>学术交流</td>" +
            "<td style='border: 1px solid silver;'>学术交流发表成果名称:" + achieve_items.academic_exchanges[i].academic_exchange_publication_name +
            "<br/>学术交流名称:" + achieve_items.academic_exchanges[i].academic_exchange_name +
            "</td><td style='border: 1px solid silver;'>学术交流类型:" + achieve_items.academic_exchanges[i].academic_exchange_type +
            "<br/>报告的地点:" + achieve_items.academic_exchanges[i].academic_exchange_address +
            "<br/>报告的时间:" + achieve_items.academic_exchanges[i].academic_exchange_time +
            "</td><td style='border: 1px solid silver;'>" + achieve_items.academic_exchanges[i].achieved_at + "</td></tr>";
    }

    for (var i = 0; i < achieve_items.academic_exchange_reports.length; i++) {  // 学术交流报告
        print_string += "<tr class='index_table_second_specs'>" +
            "<td style='border: 1px solid silver;'>学术交流报告</td>" +
            "<td style='border: 1px solid silver;'>学术交流发表成果名称:" + achieve_items.academic_exchange_reports[i].academic_exchange_publication_name +
            "</td><td style='border: 1px solid silver;'>学术交流名称:" + achieve_items.academic_exchange_reports[i].academic_exchange_name +
            "<br/>报告的时间:" + achieve_items.academic_exchange_reports[i].academic_exchange_time +
            "</td><td style='border: 1px solid silver;'>" + achieve_items.academic_exchange_reports[i].achieved_at + "</td></tr>";
    }
    print_string += "</table>";
    return print_string;
}

// 打印student搜索结果
function PrintSearchResults(students) {
    var print_string = AddPrintTitleInformation("电子科技大学博士生查询结果");
    var ths = ["姓名", "项目类别", "学号", "学院", "专业", "成果"];
    print_string += "<table cellspacing='1' style='width: 970px;table-layout:fixed'>";
    print_string = AddTheadInformation(print_string, ths);
    for (var i = 0; i < students.length; i++) {
        print_string += "<tr>" + "<td style='border: 1px solid silver;'>" + students[i].name + "</td>" +
            "<td style='border: 1px solid silver;'>" + students[i].project_type + "</td>" +
            "<td style='border: 1px solid silver;'>" + students[i].school_number + "</td>" +
            "<td style='border: 1px solid silver;'>" + students[i].academy + "</td>" +
            "<td style='border: 1px solid silver;'>" + students[i].major + "</td>" +
            "<td style='border: 1px solid silver;'>" + students[i].achievement + "</td>" +
            "</tr>";
    }
    print_string += "</table>";
    PrintBaseItem(print_string);
}

// 打印project搜索结果
function PrintProjectSearchResults(projects) {
    var print_string = AddPrintTitleInformation("电子科技大学博士生培育计划情况查询");
    var ths = ["学生", "项目类别", "学院", "项目当前阶段", "剩余金额", "立项时间"];
    print_string += "<table cellspacing='1' style='width: 970px;table-layout:fixed'>";
    print_string = AddTheadInformation(print_string, ths);
    for (var i = 0; i < projects.length; i++) {
        print_string += "<tr>" + "<td style='border: 1px solid silver;'>" + projects[i].student_name + "</td>" +
            "<td style='border: 1px solid silver;'>" + projects[i].project_type + "</td>" +
            "<td style='border: 1px solid silver;'>" + projects[i].student_academy + "</td>" +
            "<td style='border: 1px solid silver;'>" + projects[i].stage + "</td>" +
            "<td style='border: 1px solid silver;'>" + projects[i].residual_amount + "</td>" +
            "<td style='border: 1px solid silver;'>" + projects[i].started_at + "</td>" +
            "</tr>";
    }
    print_string += "</table>";
    PrintBaseItem(print_string);
}