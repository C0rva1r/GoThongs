#define USE_EVENTS
#define IS_NPC
#define FXConf$useEvtListener
#include "got/_core.lsl" 


integer STATUS;
integer FX_FLAGS;
float hp = 1;
key aggro;

// Against is data from the package, data is data from the event
integer evtCheck(string script, integer evt, string data, string against){
    if(script == ""){
        if(evt == INTEVENT_SPELL_ADDED)
            if(data != jVal(against, [0]))return FALSE;
    }
    
    return TRUE;
}

evtListener(string script, integer evt, string data){
    if(script == "got FXCompiler" && evt == FXCEvt$update)FX_FLAGS = (integer)jVal(data, [0]);
    else if(script == "got Status"){
        if(evt == StatusEvt$flags)STATUS = (integer)data;
        else if(evt == StatusEvt$monster_hp_perc)hp = (float)data;
        else if(evt == StatusEvt$monster_gotTarget)aggro = j(data, 0);
    }
}
#define isDead() (STATUS&StatusFlag$dead)
integer checkCondition(key caster, integer cond, list data, integer flags){
    if(cond == fx$COND_IS_NPC)return TRUE;
    
    if(cond == fx$COND_HAS_STATUS){
        list_shift_each(data, val, 
            if(STATUS&(integer)val)return TRUE; 
        )
        return FALSE;
    }
    
    if(cond == fx$COND_TARGETING_CASTER){
        if(llGetOwnerKey(caster) != aggro)return FALSE;
        return TRUE;
    }
     
    if(cond == fx$COND_HAS_FXFLAGS){
        list_shift_each(data, val, 
            if(FX_FLAGS&(integer)val)return TRUE;
        )
        return FALSE;
    }
    if(cond == fx$COND_HP_GREATER_THAN){
        if(hp<=llList2Float(data, 0))return FALSE;
    }
    return TRUE;
}

#include "got/classes/packages/got FX.lsl"
      