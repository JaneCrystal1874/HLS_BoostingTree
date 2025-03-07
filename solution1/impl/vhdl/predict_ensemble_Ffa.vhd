-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Ffa_rom is 
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


architecture rtl of predict_ensemble_Ffa_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 6=> "0", 7 => "1", 8 => "0", 9 => "1", 10 => "0", 11 to 12=> "1", 13 to 14=> "0", 
    15 => "1", 16 => "0", 17 => "1", 18 => "0", 19 => "1", 20 to 24=> "0", 25 => "1", 
    26 => "0", 27 to 28=> "1", 29 to 32=> "0", 33 => "1", 34 to 36=> "0", 37 => "1", 38 => "0", 
    39 to 42=> "1", 43 to 45=> "0", 46 => "1", 47 => "0", 48 => "1", 49 to 50=> "0", 51 => "1", 
    52 => "0", 53 to 57=> "1", 58 to 59=> "0", 60 => "1", 61 => "0", 62 to 64=> "1", 65 => "0", 
    66 to 73=> "1", 74 to 75=> "0", 76 to 79=> "1", 80 => "0", 81 => "1", 82 to 86=> "0", 87 => "1", 
    88 => "0", 89 to 90=> "1", 91 to 92=> "0", 93 => "1", 94 => "0", 95 to 96=> "1", 97 => "0", 
    98 => "1", 99 to 101=> "0", 102 => "1", 103 => "0", 104 => "1", 105 to 106=> "0", 107 => "1", 
    108 to 109=> "0", 110 => "1", 111 to 112=> "0", 113 => "1", 114 => "0", 115 to 116=> "1", 117 to 118=> "0", 
    119 => "1", 120 => "0", 121 to 122=> "1", 123 to 124=> "0", 125 => "1", 126 to 128=> "0", 129 => "1", 
    130 => "0", 131 to 132=> "1", 133 to 135=> "0", 136 to 138=> "1", 139 to 141=> "0", 142 to 147=> "1", 148 to 150=> "0", 
    151 => "1", 152 to 154=> "0", 155 to 156=> "1", 157 => "0", 158 to 160=> "1", 161 to 162=> "0", 163 => "1", 
    164 => "0", 165 to 166=> "1", 167 => "0", 168 => "1", 169 => "0", 170 => "1", 171 => "0", 
    172 to 175=> "1", 176 => "0", 177 to 178=> "1", 179 to 180=> "0", 181 to 182=> "1", 183 to 185=> "0", 186 to 192=> "1", 
    193 to 194=> "0" );

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

entity predict_ensemble_Ffa is
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

architecture arch of predict_ensemble_Ffa is
    component predict_ensemble_Ffa_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Ffa_rom_U :  component predict_ensemble_Ffa_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


