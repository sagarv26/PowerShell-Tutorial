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
$xmlWriter.WriteStartElement("SubObject") # <-- Start <SubObject>
$xmlWriter.WriteElementString("Property3","Value 3")
$xmlWriter.WriteEndElement() # <-- End <SubObject>
$xmlWriter.WriteEndElement() # <-- End <Object>
$xmlWriter.WriteEndElement() # <-- End <Root>
# End, Finalize and close the XML Document
$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()