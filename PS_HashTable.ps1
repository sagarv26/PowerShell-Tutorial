
#Initializing an Empty Hash Table
$pets = @{}

#Initializing a Hash Table
$pets = @{Cat = 'Frisky';Dog = 'Spot';Fish = 'Nimo';Hamster = 'Whiskers'}

#Accessing Hash Table Items
$pets.Cat    # Frisky
$pets.Dog    # Spot
$pets.Fish    # Nimo
$pets.Hamster  # Whiskers

#Accessing Hash Table Items
$pets.Add('Cat', 'Frisky')
$pets.Add('Dog', 'Spot')
$pets.Add('Fish', 'Nimo')
$pets.Add('Hamster', 'Whiskers')

$pets.Cat = 'Frisky'
$pets.Dog = 'Spot'
$pets.Fish = 'Nimo'
$pets.Hamster = 'Whiskers'

#Removing Items from a Hash Table
$pets.Remove('Hamster')

foreach($pet in $pets.keys)
{
    $pet # Print each Key
    $pets.$pet # Print value of each Key
}

#Format-List
$pets | Format-List