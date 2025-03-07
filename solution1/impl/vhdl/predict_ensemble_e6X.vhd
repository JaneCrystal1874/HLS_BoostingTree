-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e6X_rom is 
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


architecture rtl of predict_ensemble_e6X_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 4=> "0", 5 => "1", 6 to 7=> "0", 8 => "1", 9 => "0", 10 => "1", 11 => "0", 
    12 to 16=> "1", 17 to 19=> "0", 20 => "1", 21 to 22=> "0", 23 to 24=> "1", 25 to 28=> "0", 29 => "1", 
    30 => "0", 31 => "1", 32 to 34=> "0", 35 => "1", 36 to 37=> "0", 38 to 41=> "1", 42 => "0", 
    43 to 44=> "1", 45 => "0", 46 to 49=> "1", 50 to 54=> "0", 55 to 56=> "1", 57 to 61=> "0", 62 => "1", 
    63 => "0", 64 to 65=> "1", 66 to 67=> "0", 68 => "1", 69 => "0", 70 to 73=> "1", 74 to 77=> "0", 
    78 => "1", 79 => "0", 80 to 84=> "1", 85 to 88=> "0", 89 => "1", 90 to 95=> "0", 96 to 101=> "1", 
    102 => "0", 103 to 107=> "1", 108 => "0", 109 => "1", 110 to 112=> "0", 113 to 114=> "1", 115 to 116=> "0", 
    117 to 118=> "1", 119 to 120=> "0", 121 to 123=> "1", 124 => "0", 125 => "1", 126 to 130=> "0", 131 to 133=> "1", 
    134 to 137=> "0", 138 => "1", 139 to 140=> "0", 141 to 143=> "1", 144 => "0", 145 => "1", 146 to 149=> "0", 
    150 => "1", 151 => "0", 152 => "1", 153 to 154=> "0", 155 => "1", 156 => "0", 157 to 159=> "1", 
    160 => "0", 161 to 163=> "1", 164 to 165=> "0", 166 to 171=> "1", 172 => "0", 173 to 178=> "1", 179 to 194=> "0" );

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

entity predict_ensemble_e6X is
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

architecture arch of predict_ensemble_e6X is
    component predict_ensemble_e6X_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e6X_rom_U :  component predict_ensemble_e6X_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


