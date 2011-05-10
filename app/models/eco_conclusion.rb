class EcoConclusion 
  def computeNPVR1(user_id, transformer_id)
      repinfo = RepairInformation.get_repair_information(user_id, transformer_id)
      if repinfo.nil?
        return nil
      end

      factorsetting = FactorSetting.find_by_user_id(user_id)
      if factorsetting.nil?
        return nil
      end

      transformer = Transformer.find_by_id(transformer_id)
      if transformer.nil?
        return nil
    end

      price_loss = TransformerPriceLoss.get_transformer_price_loss(user_id, transformer_id)
 
      acquisition_cost = repinfo.winding_cost + repinfo.bushing_cost + repinfo.arrester_cost +
           repinfo.oltc_cost + repinfo.hotline_cost + repinfo.cooling + repinfo.overhaul +
           repinfo.overhaul_and_refurbish + repinfo.rep_rubber_bag + repinfo.rep_bct + 
           repinfo.others

      i = factorsetting.intrate 
      p_a_i_n = (((1 + (i/100))**repinfo.repair_age) - 1)/((i/100) * ((1 + (i/100))**repinfo.repair_age))
      pw_noload_loss_cost = price_loss.noload_loss * 8760 * factorsetting.loadloss 
      pw_loadloss_cost = ((factorsetting.loadavg/100)**2) * price_loss.loadloss * 8760 * factorsetting.loadloss 
      pw_mnt_cost = repinfo.mc_avg 
      pw_pm_cost  = repinfo.pm 
      pw_nodeliver_cost = (factorsetting.unavailability/100) * transformer.maxcapacity * factorsetting.powerfactor * 1000 * 
                          (factorsetting.loadavg/100) * factorsetting.power * 8760

      p_f_i_n = 1/((1 + (i/100))**repinfo.repair_age)
      pw_disposal_cost = repinfo.det_cost* p_f_i_n

      year_usage = Date.today.year - transformer.first_energize.year
      if(year_usage + repinfo.repair_age >= factorsetting.zerolife)
        pw_salvage = 0
      else
        pw_salvage = price_loss.transformer_price - ((price_loss.transformer_price * (year_usage + repinfo.repair_age))/factorsetting.zerolife)
      end

      return acquisition_cost + (p_a_i_n * (pw_noload_loss_cost + pw_loadloss_cost + pw_mnt_cost + pw_pm_cost + pw_nodeliver_cost)) + pw_disposal_cost - pw_salvage
  end

  def computeNPVR2(user_id, transformer_id)

    return 0
  end

  def computeNPV1(user_id, transformer_id)
    npvr1 = self.computeNPVR1(user_id, transformer_id)
    if npvr1.nil?
      return "-"
    end

    npvr2 = self.computeNPVR2(user_id, transformer_id)
    if npvr2.nil?
      return "-"
    end

    return npvr1.to_f + npvr2.to_f
  end


end