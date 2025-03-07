-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bIp_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bIp_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 => "0", 5 => "1", 6 to 9=> "0", 
    10 => "1", 11 to 12=> "0", 13 to 15=> "1", 16 => "0", 17 => "1", 18 => "0", 19 to 20=> "1", 
    21 to 22=> "0", 23 => "1", 24 => "0", 25 => "1", 26 => "0", 27 => "1", 28 => "0", 
    29 to 31=> "1", 32 to 33=> "0", 34 => "1", 35 => "0", 36 => "1", 37 to 38=> "0", 39 to 41=> "1", 
    42 => "0", 43 => "1", 44 => "0", 45 => "1", 46 to 47=> "0", 48 => "1", 49 => "0", 
    50 => "1", 51 => "0", 52 => "1", 53 to 54=> "0", 55 to 56=> "1", 57 => "0", 58 to 59=> "1", 
    60 to 61=> "0", 62 => "1", 63 to 65=> "0", 66 => "1", 67 to 69=> "0", 70 => "1", 71 to 72=> "0", 
    73 => "1", 74 => "0", 75 => "1", 76 to 80=> "0", 81 to 82=> "1", 83 to 86=> "0", 87 to 88=> "1", 
    89 to 91=> "0", 92 to 96=> "1", 97 => "0", 98 to 99=> "1", 100 => "0", 101 to 102=> "1", 103 => "0", 
    104 to 105=> "1", 106 => "0", 107 => "1", 108 => "0", 109 to 113=> "1", 114 => "0", 115 to 116=> "1", 
    117 to 119=> "0", 120 => "1", 121 to 125=> "0", 126 => "1", 127 to 129=> "0", 130 to 131=> "1", 132 => "0", 
    133 => "1", 134 => "0", 135 to 136=> "1", 137 to 138=> "0", 139 to 140=> "1", 141 to 142=> "0", 143 to 147=> "1", 
    148 to 149=> "0", 150 => "1", 151 to 155=> "0", 156 to 160=> "1", 161 => "0", 162 to 163=> "1", 164 => "0", 
    165 => "1", 166 => "0", 167 to 168=> "1", 169 to 170=> "0", 171 => "1", 172 to 174=> "0", 175 to 180=> "1", 
    181 => "0", 182 to 184=> "1", 185 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_bIp is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bIp is
    component predict_ensemble_bIp_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bIp_rom_U :  component predict_ensemble_bIp_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


