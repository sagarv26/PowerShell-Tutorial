# First Method
$xdoc = New-Object System.Xml.XmlDocument
$file = Resolve-Path("G:\PS-Test\ps-xml.xml")
$xdoc.load($file)

# Second Method
[xml] $xdoc = Get-Content "G:\PS-Test\ps-xml.xml"

# Third Method
$xdoc = [xml] (Get-Content "G:\PS-Test\ps-xml.xml")

#Accessing XML as Objects
$xml = [xml](Get-Content "G:\PS-Test\ps-xml.xml")
$xml
$xml.people
$xml.people.person

$xml.people.person[0].name
$xml.people.person[1].age
$xml.people.person[2].id

#Accessing XML with XPath
$xml = [xml](Get-Content "G:\PS-Test\ps-xml.xml")
$xml
$xml.SelectNodes("//people")

$xml.SelectNodes("//people//person")

$xml.SelectSingleNode("people//person[1]//name")

$xml.SelectSingleNode("people//person[2]//age")

$xml.SelectSingleNode("people//person[3]//@id")


#Accessing XML containing namespaces with XPath
[xml]$xml = @"
<ns:people xmlns:ns="http://schemas.xmlsoap.org/soap/envelope/">
<ns:person id="101">
<ns:name>Jon Lajoie</ns:name>
</ns:person>
<ns:person id="102">
<ns:name>Lord Gaben</ns:name>
</ns:person>
<ns:person id="103">
<ns:name>Gordon Freeman</ns:name>
</ns:person>
</ns:people>
"@
$ns = new-object Xml.XmlNamespaceManager 
$xml.NameTable
$ns.AddNamespace("ns", $xml.DocumentElement.NamespaceURI)
$xml.SelectNodes("//ns:people/ns:person", $ns)

$xmlsettings = New-Object System.Xml.XmlWriterSettings
$xmlsettings.Indent = $true
$xmlsettings.IndentChars = " "

# Set the File Name Create The Document
$XmlWriter = [System.XML.XmlWriter]::Create("G:\PS-Test\YourXML.xml", $xmlsettings)

# Write the XML Declaration and set the XSL
$xmlWriter.WriteStartDocument()
$xmlWriter.WriteProcessingInstruction("xml-stylesheet", "type='text/xsl' href='style.xsl'")

# Start the Root Element
$xmlWriter.WriteStartElement("Root")
$xmlWriter.WriteStartElement("Object") # <-- Start <Object>
$xmlWriter.WriteElementString("Property1","Value 1")
$xmlWriter.WriteElementString("Property2","Value 2")
$xmlWriter.WriteStartElement("SubObject") # < -- Start <SubObject>
$xmlWriter.WriteElementString("Property3","Value 3")
$xmlWriter.WriteEndElement() # <-- End <SubObject>
$xmlWriter.WriteEndElement() # <-- End <Object>
$xmlWriter.WriteEndElement() # <-- End <Root>

# End, Finalize and close the XML Document
$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()

$xml = [xml](Get-Content "G:\PS-Test\YourXML.xml")
$xml.Root.Object