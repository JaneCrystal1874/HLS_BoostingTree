-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_daE_rom is 
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


architecture rtl of predict_ensemble_daE_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 5=> "0", 6 => "1", 7 to 8=> "0", 
    9 to 10=> "1", 11 => "0", 12 => "1", 13 => "0", 14 to 15=> "1", 16 => "0", 17 => "1", 
    18 to 20=> "0", 21 to 23=> "1", 24 => "0", 25 => "1", 26 => "0", 27 => "1", 28 to 29=> "0", 
    30 => "1", 31 => "0", 32 to 33=> "1", 34 to 37=> "0", 38 to 39=> "1", 40 to 41=> "0", 42 to 43=> "1", 
    44 to 46=> "0", 47 to 50=> "1", 51 to 53=> "0", 54 => "1", 55 to 56=> "0", 57 to 60=> "1", 61 => "0", 
    62 => "1", 63 to 65=> "0", 66 to 68=> "1", 69 => "0", 70 => "1", 71 to 73=> "0", 74 => "1", 
    75 => "0", 76 => "1", 77 => "0", 78 to 81=> "1", 82 to 84=> "0", 85 => "1", 86 to 87=> "0", 
    88 to 89=> "1", 90 => "0", 91 to 92=> "1", 93 to 95=> "0", 96 => "1", 97 => "0", 98 => "1", 
    99 to 101=> "0", 102 => "1", 103 => "0", 104 to 105=> "1", 106 => "0", 107 to 108=> "1", 109 to 110=> "0", 
    111 to 112=> "1", 113 => "0", 114 to 115=> "1", 116 to 118=> "0", 119 => "1", 120 to 121=> "0", 122 to 123=> "1", 
    124 to 125=> "0", 126 to 127=> "1", 128 to 130=> "0", 131 to 134=> "1", 135 => "0", 136 to 137=> "1", 138 to 139=> "0", 
    140 to 141=> "1", 142 to 143=> "0", 144 to 145=> "1", 146 to 148=> "0", 149 => "1", 150 => "0", 151 => "1", 
    152 => "0", 153 to 154=> "1", 155 to 156=> "0", 157 to 161=> "1", 162 to 165=> "0", 166 to 167=> "1", 168 => "0", 
    169 to 171=> "1", 172 => "0", 173 => "1", 174 => "0", 175 => "1", 176 to 177=> "0", 178 => "1", 
    179 => "0", 180 => "1", 181 to 182=> "0", 183 to 185=> "1", 186 => "0", 187 to 188=> "1", 189 to 194=> "0" );

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

entity predict_ensemble_daE is
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

architecture arch of predict_ensemble_daE is
    component predict_ensemble_daE_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_daE_rom_U :  component predict_ensemble_daE_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


