//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
    var fuelTopHit = 0
    var fuelTopMiss = 0
    var teleopFuelTopHit = 0
    var teleopFuelTopMiss = 0
    var autoGearsCollected = 0
    var autoGearsDelivered = 0
    var teleopGearsCollected = 0
    var teleopGearsDelivered =0
    
    $('#addFuelTopHit').click(function() {
        fuelTopHit += 1
        $('#addFuelTopHit').text('Hits: ' + fuelTopHit)
        $('#autoFuelTopHit').val(fuelTopHit)
        updateAutoAccuracy()
    })
    
    $('#addFuelTopMiss').click(function() {
        fuelTopMiss += 1
        $('#addFuelTopMiss').text('Misses: ' + fuelTopMiss)
        $('#autoFuelTopMiss').val(fuelTopMiss)
        updateAutoAccuracy()
    })
    
    $('#addTeleopFuelTopHit').click(function() {
        teleopFuelTopHit += 1
        $('#addTeleopFuelTopHit').text('Hits: ' + teleopFuelTopHit)
        $('#teleopFuelTopHit').val(teleopFuelTopHit)
    })
    
    $('#addTeleopFuelTopMiss').click(function() {
        teleopFuelTopMiss += 1
        $('#addTeleopFuelTopMiss').text('Misses: ' + teleopFuelTopMiss)
        $('#teleopFuelTopMiss').val(teleopFuelTopHit)
    })
    
    $('#addAutoGearsCollected').click(function() {
        autoGearsCollected += 1
        $('#addAutoGearsCollected').text('Gears Collected: ' + autoGearsCollected)
        $('#autoGearsCollected').val(autoGearsCollected)
    })
    
    $('#addAutoGearsDelivered').click(function() {
        autoGearsDelivered += 1
        $('#addAutoGearsDelivered').text('Gears Delivered: ' + autoGearsDelivered)
        $('#autoGearsDelivered').val(autoGearsDelivered)
    })
    
    $('#addTeleopGearsCollected').click(function() {
        teleopGearsCollected += 1
        $('#addTeleopGearsCollected').text('Gears Collected: ' + teleopGearsCollected)
        $('#teleopGearsCollected').val(teleopGearsCollected)
    })
    
    $('#addTeleopGearsDelivered').click(function() {
        teleopGearsDelivered += 1
        $('#addTeleopGearsDelivered').text('Gears Delivered: ' + teleopGearsDelivered)
        $('#teleopGearsDelivered').val(teleopGearsDelivered)
    })
    
    function updateAutoAccuracy() {
        var hitString = $('#autoFuelTopHit').val()
        var missString = $('autoFuelTopMiss').val()
        var hit = parseInt(hitString, 10)
        var miss = parseInt(missString, 10)
        console.log("Hit: " + hit)
        console.log("Miss: " + miss)
        $('#autoAccuracy').attr('value', (hit/(hit+miss)))
    }
    
    setTimeout(function() {
        $('.alert-flash').remove()
    }, 3000)
})