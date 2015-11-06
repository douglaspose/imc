<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cálculo IMC</title>
    <link href="tools/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="tools/jquery.min.js"></script> 
    <script type="text/javascript" src="tools/cufon-yui.js"></script>
    <script type="text/javascript" src="tools/Bebas_400.font.js"></script>
    <script type="text/javascript" src="tools/Bell_Gothic_Std_300.font.js"></script>
    <script type="text/javascript">
            Cufon.replace('a.logo', {fontFamily: 'Bebas'});
            Cufon.replace('a.logo span', {fontFamily: 'Bell Gothic Std'});
    </script>
</head>
<body>
<div class="main_container">
    
    <div class="header">
            <a class="logo" href="#">Calculo IMC<span>Indice de Massa CorpOrea</span></a>
    </div>
    <div class="content">
        <form class="imc">
            <input type="text" class="field" name="peso" placeholder="Informe seu peso (kg)" />
            <input type="text" class="field" name="altura" placeholder="Informe sua altura (m)"/>
            
            <%
                
                
                String paramPeso = request.getParameter("peso");
                paramPeso = paramPeso == null ? "0" : paramPeso;                
                paramPeso = paramPeso == "" ? "0" : paramPeso;
                paramPeso = paramPeso.replace(",", ".");
                double peso = Double.parseDouble(paramPeso);

                String paramAltura = request.getParameter("altura");
                paramAltura = paramAltura == null ? "0" : paramAltura;                
                paramAltura = paramAltura == "" ? "0" : paramAltura;
                paramAltura = paramAltura.replace(",", ".");
                double altura = Double.parseDouble(paramAltura);

                double total = peso / (altura * altura);
                
                DecimalFormat df = new DecimalFormat("0.00");  
                String resultado = df.format(total);
                
                String status = "";
                
                if (total <= 19)
                {
                    status = "Abaixo do peso.";
                }
                else if (total > 19 && total <= 26)
                {
                    status = "Peso normal.";
                }
                else if (total > 26 && total <= 31)
                {
                    status = "Acima do peso.";
                }
                else if (total > 31)
                {
                    status = "Obeso.";
                }                
                else
                {
                    status = "";
                }
            %>
            
            <input type="text" class="field" name="resultado" placeholder="Resultado" value="<% out.print(resultado); %>" />
            <h1><% out.print(status); %></h1>
            <input type="submit" class="submit" value="CALCULAR" />
        </form>
    </div>	
    
</div>
</body>
</html>
