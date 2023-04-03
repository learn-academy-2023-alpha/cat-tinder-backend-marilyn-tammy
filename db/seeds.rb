beers = [
    {
        name: 'Sculpin',
        abv: '7%',
        style: 'IPA',
        brewery: 'Ballast Point',
        profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
        image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg'
    },
    {
        name: 'Nitro Cali Creamin',
        abv: '5.5%',
        style: 'Cream Ale',
        brewery: 'Mother Earth Brew Co',
        profile: 'Brewed with Madagascar vanilla bean for a cream soda kick, but finishes dry despite sweetness',
        image: 'https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/wk65222287-image-kp6ce6v6.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=14fa0443dd6fc1cdd686a2836907e28a'
    }, 
    {
        name: 'Stone IPA',
        abv: '6.9%',
        style: 'IPA',
        brewery: 'Stone Brewing',
        profile: 'Explodes with tropical, citrusy, piney hop flavors and aromas, all perfectly balanced by a subtle malt character',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4vJjf17aybc39kjaU2HLeg-QDNyw6bE6JXW2tHiRbRD-VmjA6pKnd5P8IasmPaekolDE&usqp=CAU'
    },
    {
        name: 'Deftones Phantom Bride',
        abv: '7.1%',
        style: 'IPA',
        brewery: 'Belching Beaver',
        profile: 'Blend of Amarillo, Citra, Simcoe, and Mosaic hops delicately balanced for the perfectly drinkable mix of citrus and hoppy goodness',
        image: 'https://images.unsplash.com/photo-1625780606676-25e29d992e30?ixlib=rb-4.0.3&ixid=MnwxM[…]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    }, 
    {
        name: 'Black House',
        abv: '5.8%',
        style: 'Stout',
        brewery: 'Modern Times',
        profile: 'Chocolate-covered espresso bean, only drier and more like beer',
        image: 'https://live.staticflickr.com/707/32469422646_ebb3ab47be_b.jpg'
    }
]

beers.each do |beer|
    Beer.create beer
    puts "creating beer #{beer}"
end