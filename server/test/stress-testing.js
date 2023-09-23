const artillery = require('artillery') ;

const config = require('../config.yml');

artillery.run(config, (err) =>  {
    if(err) {
        console.error('Error during test: ', err); 
    }
})

 